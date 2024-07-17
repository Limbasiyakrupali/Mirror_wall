import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BookmarkProvider extends ChangeNotifier {
  // static Set<String> bookurl = {};
  // static List<String> bookmarkurl = [];

  // void converturldata(String url) {
  //   if (BookmarkProvider.bookmarkurl.contains(url)) {
  //     BookmarkProvider.bookmarkurl.remove(url);
  //   } else {
  //     BookmarkProvider.bookmarkurl.add(url);
  //   }
  // }

  List bookmarkurl = [];

  void addurl(WebUri bookurl) {
    bookmarkurl.add(bookurl);
    notifyListeners();
  }

  void removeurl(WebUri bookurl) {
    bookmarkurl.remove(bookurl);
    notifyListeners();
  }
}
