import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/bookmark_provider.dart';
import 'package:mirror_wall/provider/bookmarkurl.dart';
import 'package:mirror_wall/provider/delete_provider.dart';
import 'package:mirror_wall/provider/radio_provider.dart';
import 'package:mirror_wall/views/bookmark.dart';
import 'package:mirror_wall/views/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return RadioProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return BookmarkProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return DeleteProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return RadioProvider();
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (contex) => const Homepage(),
        'bookmark': (contex) => const bookmark(),
        'bookmarkurl': (contex) => const Bookmarkurl(),
      },
    );
  }
}
