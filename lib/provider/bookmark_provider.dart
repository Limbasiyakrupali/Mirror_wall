import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BookmarkProvider extends ChangeNotifier {
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
