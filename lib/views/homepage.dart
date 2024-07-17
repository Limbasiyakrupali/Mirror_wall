import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror_wall/provider/bookmark_provider.dart';
import 'package:mirror_wall/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  InAppWebViewController? inAppWebViewController;
  TextEditingController searchController = TextEditingController();

  void performSearch(String query) {
    String searchUrl = '';
    String selectedSearchEngine =
        Provider.of<RadioProvider>(context, listen: false).selectedRadio;

    switch (selectedSearchEngine) {
      case 'Google':
        searchUrl = 'https://www.google.com/search?q=$query';
        break;
      case 'Yahoo':
        searchUrl = 'https://search.yahoo.com/search?p=$query';
        break;
      case 'Bing':
        searchUrl = 'https://www.bing.com/search?q=$query';
        break;
      case 'DuckDuckGo':
        searchUrl = 'https://www.duckduckgo.com/?q=$query';
        break;
      default:
        searchUrl = 'https://www.google.com/search?q=$query';
        'https://search.yahoo.com/search?p=$query';
        'https://www.bing.com/search?q=$query';
        'https://www.duckduckgo.com/?q=$query';
    }

    inAppWebViewController?.loadUrl(
        urlRequest: URLRequest(url: WebUri(searchUrl)));
  }

  void showSearchEngineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Search Engine'),
          content: Consumer<RadioProvider>(
            builder: (context, provider, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text('Google'),
                    value: 'Google',
                    groupValue: provider.selectedRadio,
                    onChanged: (value) {
                      Navigator.of(context).pop(); // Close dialog
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Yahoo'),
                    value: 'Yahoo',
                    groupValue: provider.selectedRadio,
                    onChanged: (value) {
                      Navigator.of(context).pop(); // Close dialog
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Bing'),
                    value: 'Bing',
                    groupValue: provider.selectedRadio,
                    onChanged: (value) {
                      Navigator.of(context).pop(); // Close dialog
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('DuckDuckGo'),
                    value: 'DuckDuckGo',
                    groupValue: provider.selectedRadio,
                    onChanged: (value) {
                      Navigator.of(context).pop(); // Close dialog
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Browser",
          style: GoogleFonts.getFont("Mulish"),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pushNamed("bookmark");
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.bookmark, size: 27),
                          const SizedBox(width: 12),
                          Text(
                            "All Bookmarks",
                            style: GoogleFonts.getFont("Mulish",
                                textStyle: const TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        showSearchEngineDialog(context);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.laptop_chromebook),
                          const SizedBox(width: 12),
                          Text(
                            "Search Engine",
                            style: GoogleFonts.getFont("Mulish",
                                textStyle: const TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ];
          })
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: InAppWebView(
              initialUrlRequest:
                  URLRequest(url: WebUri("https://www.google.com/")),
              onLoadStart: (controller, url) {
                inAppWebViewController = controller;
              },
            ),
          ),
          SingleChildScrollView(
            child: Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search...',
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.search),
                                    onPressed: () {
                                      if (searchController.text.isNotEmpty) {
                                        performSearch(searchController.text);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.loadUrl(
                                urlRequest: URLRequest(
                                    url: WebUri("https://google.com/")));
                          },
                          icon: (const Icon(Icons.home))),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.goBack();
                          },
                          icon: (const Icon(Icons.arrow_back))),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.reload();
                          },
                          icon: (const Icon(Icons.refresh))),
                      IconButton(
                        onPressed: () async {
                          WebUri? weburi =
                              await inAppWebViewController?.getOriginalUrl();
                          Provider.of<BookmarkProvider>(context, listen: false)
                              .addurl(
                            WebUri("$weburi"),
                          );
                        },
                        icon: const Icon(Icons.bookmark_add_outlined),
                      ),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.goForward();
                          },
                          icon: (const Icon(Icons.arrow_forward))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
