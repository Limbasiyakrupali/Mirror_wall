import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

class DeleteProvider extends ChangeNotifier {
  void deleteAll(context) {
    Provider.of<BookmarkProvider>(context).bookmarkurl.clear();
    notifyListeners();
  }

  void deleteBookMark(int index, context) {
    Provider.of<BookmarkProvider>(context).bookmarkurl.remove(index);
    Provider.of<BookmarkProvider>(context).bookmarkurl.removeAt(index);
    notifyListeners();
  }
}
