import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

class DeleteProvider extends ChangeNotifier {
  void deleteAll(BuildContext context) {
    Provider.of<BookmarkProvider>(context, listen: false).bookmarkurl.clear();
    notifyListeners();
  }

  void deleteBookMark(int val, BuildContext context) {
    Provider.of<BookmarkProvider>(context, listen: false)
        .bookmarkurl
        .removeAt(val);
    notifyListeners();
  }
}
