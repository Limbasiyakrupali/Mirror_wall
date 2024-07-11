import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  String radiostatus = "";
  void changeradiostatus(status) {
    radiostatus = status;
    notifyListeners();
  }
}
