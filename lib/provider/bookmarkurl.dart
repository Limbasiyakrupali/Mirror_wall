import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmarkurl extends StatefulWidget {
  const Bookmarkurl({super.key});

  @override
  State<Bookmarkurl> createState() => _BookmarkurlState();
}

class _BookmarkurlState extends State<Bookmarkurl> {
  @override
  Widget build(BuildContext context) {
    WebUri data = ModalRoute.of(context)!.settings.arguments as WebUri;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Browser",
          style: GoogleFonts.getFont("Mulish"),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("${data}"),
        ),
      ),
    );
  }
}
