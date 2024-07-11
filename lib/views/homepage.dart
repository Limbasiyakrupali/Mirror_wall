import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror_wall/provider/bookmark_provider.dart';
import 'package:mirror_wall/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  InAppWebViewController? inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "My Browser",
            style: GoogleFonts.getFont(
              "Mulish",
            ),
          ),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("bookmark");
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bookmark,
                              size: 27,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "All Bookmarks",
                              style: GoogleFonts.getFont("Mulish",
                                  textStyle: const TextStyle(fontSize: 14)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          const AlertDialog(
                            actions: [Icon(Icons.access_time)],
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.laptop_chromebook),
                            const SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Consumer<RadioProvider>(
                                          builder: (context,
                                              RadioProvider value, _) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Radio(
                                                        value: value.strGoogle,
                                                        groupValue:
                                                            value.selectedRadio,
                                                        onChanged: (val) {
                                                          value
                                                              .handleRadioValueChange(
                                                                  val!,
                                                                  context);
                                                        }),
                                                    Text(
                                                      "Google",
                                                      style: GoogleFonts.getFont(
                                                          "Mulish",
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Radio(
                                                        value: value.strYahoo,
                                                        groupValue:
                                                            value.selectedRadio,
                                                        onChanged: (val) {
                                                          value
                                                              .handleRadioValueChange(
                                                                  val!,
                                                                  context);
                                                        }),
                                                    Text(
                                                      "Yahoo",
                                                      style: GoogleFonts.getFont(
                                                          "Mulish",
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Radio(
                                                        value: value.strBing,
                                                        groupValue:
                                                            value.selectedRadio,
                                                        onChanged: (val) {
                                                          value
                                                              .handleRadioValueChange(
                                                                  val!,
                                                                  context);
                                                        }),
                                                    Text(
                                                      "Bing",
                                                      style: GoogleFonts.getFont(
                                                          "Mulish",
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Radio(
                                                        value:
                                                            value.strDuckDuckGo,
                                                        groupValue:
                                                            value.selectedRadio,
                                                        onChanged: (val) {
                                                          value
                                                              .handleRadioValueChange(
                                                                  val!,
                                                                  context);
                                                        }),
                                                    Text(
                                                      "DuckDuckGo",
                                                      style: GoogleFonts.getFont(
                                                          "Mulish",
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Search Engine",
                                style: GoogleFonts.getFont("Mulish",
                                    textStyle: const TextStyle(fontSize: 14)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ];
            })
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: WebUri(
                            "${Provider.of<RadioProvider>(context, listen: false).strMainURL}")),
                    onLoadStart: (controller, url) {
                      inAppWebViewController = controller;
                    }),
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
                              Container(
                                height: 48,
                                width: 350,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.search),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      TextFormField()
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  inAppWebViewController?.getOriginalUrl();
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
                              onPressed: () {
                                String currentUrl = "";
                                Provider.of<BookmarkProvider>(context,
                                        listen: false)
                                    .converturldata(currentUrl);
                                print(currentUrl);
                              },
                              icon: Icon(Icons.bookmark_add_outlined),
                            ),
                            IconButton(
                                onPressed: () {
                                  inAppWebViewController?.goForward();
                                },
                                icon: (const Icon(Icons.arrow_forward))),
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
