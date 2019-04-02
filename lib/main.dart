import 'package:flutter/material.dart';
import 'package:flutter_xu/ui/page_article.dart';


void main() => runApp(ArticleApp());

class ArticleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "文章",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17.0
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: new ArticlePage(),
      ),
    );
  }
}


