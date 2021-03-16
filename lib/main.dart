import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xu/ui/page_article.dart';
import 'dart:core';

import 'bloctest/test.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(Example());
}

Map<String, WidgetBuilder> routes = {
  ArticleApp.ROUT_NMAE: (context) => new ArticleApp(),
  Test.ROUT_NMAE: (context) => new ArticleApp()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    Fimber.d(' hhhhhh ');
    debugPrint("BuildContext");
    return new MaterialApp(
      title: "测试样例",
      routes: routes,
      home: new Scaffold(
        appBar: new AppBar(title: Text("三个")),
        body: Home(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("initState");
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String lc = myLocale.languageCode;
    Fimber.d("myLocale.languageCode.lc=" + lc);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //子控件左对齐
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Text("测试rout"),
              onPressed: () {
                Fimber.d('点击跳转1');
                Navigator.pushNamed(context, ArticleApp.ROUT_NMAE);
              },
              padding: EdgeInsets.all(10),
            ),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: RaisedButton(
              child: Text("测试"),
              onPressed: () {
                Navigator.pushNamed(context, Test.ROUT_NMAE);
              },
              padding: EdgeInsets.all(10),
            ),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
            child: RaisedButton(
              child: Text("点击跳转3"),
              onPressed: () {
                Navigator.pushNamed(context, ArticleApp.ROUT_NMAE);
              },
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildScaffold(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("第一个页面")),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //子控件左对齐
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text("点击跳转1"),
                onPressed: () {
                  Fimber.d('点击跳转1');
                  Navigator.pushNamed(context, ArticleApp.ROUT_NMAE);
                },
                padding: EdgeInsets.all(10),
              ),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: RaisedButton(
                child: Text("点击跳转2"),
                onPressed: () {
                  Navigator.pushNamed(context, ArticleApp.ROUT_NMAE);
                },
                padding: EdgeInsets.all(10),
              ),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              child: RaisedButton(
                child: Text("点击跳转3"),
                onPressed: () {
                  Navigator.pushNamed(context, ArticleApp.ROUT_NMAE);
                },
                padding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ));
}

class ArticleApp extends StatelessWidget {
  static const ROUT_NMAE = "/TestRout";
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "文章",
            style: const TextStyle(color: Colors.white, fontSize: 17.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: new ArticlePage(),
      ),
    );
  }
}
