import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/bookmark_provider.dart';
import 'package:mirror_wall/provider/delete_provider.dart';
import 'package:provider/provider.dart';

class bookmark extends StatefulWidget {
  const bookmark({super.key});

  @override
  State<bookmark> createState() => _bookmarkState();
}

class _bookmarkState extends State<bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark"),
      ),
      body: Provider.of<BookmarkProvider>(context).bookmarkurl.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.no_sim,
                    size: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "No Bookmark",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Consumer<BookmarkProvider>(
              builder: (BuildContext context, bookmark, Widget? child) {
                return ListView.builder(
                  itemCount: bookmark.bookmarkurl.length,
                  itemBuilder: (context, val) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("bookmarkurl",
                            arguments: bookmark.bookmarkurl[val]);
                      },
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 280,
                                child: Text(
                                  "${bookmark.bookmarkurl[val]}",
                                  style: TextStyle(fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Provider.of<DeleteProvider>(context,
                                            listen: false)
                                        .deleteBookMark(val, context);
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
