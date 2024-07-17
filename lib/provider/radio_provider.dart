import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/search_provider.dart';

class RadioProvider extends ChangeNotifier {
  String selectedRadio = '';
  List<SearchEngine> searchEngines = [
    SearchEngine(
        name: "Google",
        mainURL: "https://www.google.com/",
        searchURL: "https://www.google.com/search?q"),
    SearchEngine(
        name: "Yahoo",
        mainURL: "https://in.search.yahoo.com",
        searchURL: "https://in.search.yahoo.com/search?q"),
    SearchEngine(
        name: "Bing",
        mainURL: "https://www.bing.com",
        searchURL: "https://www.bing.com/search?q"),
    SearchEngine(
        name: "DuckDuckGo",
        mainURL: "https://duckduckgo.com",
        searchURL: "https://duckduckgo.com/search?q"),
  ];

  late SearchEngine selectedSearchEngine;

  RadioProvider() {
    selectedSearchEngine = searchEngines[2];
  }
}
