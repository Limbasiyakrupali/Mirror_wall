import 'package:flutter/material.dart';

class BookmarkProvider extends ChangeNotifier {
  static Set<String> bookurl = {};
  static List<String> bookmarkurl = [];

  void converturldata(String url) {
    // bookmarkurl = bookurl.toList();
    if (BookmarkProvider.bookmarkurl.contains(url)) {
      BookmarkProvider.bookmarkurl.remove(url);
    } else {
      BookmarkProvider.bookmarkurl.add(url);
    }
  }
}
