import 'package:flutter/material.dart';

///页面跳转
void main() => runApp(new FirstPage());

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "第一个页面",
      home: Builder(builder: buildScaffold), //Builder
    ); //MaterialApp
  }
}

///创建一个widget
Widget buildScaffold(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("第一个页面"),),
    body: RaisedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return new SecondPage();
      }));
    }, child: Text("点击跳转第二个页面"),),
  ); //Scaffo
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///无需指定MaterialApp，使用的是第一个页面的风格，可指定AppBar
    return Scaffold(
      appBar: AppBar(title: Text("第二个页面"),),
      body: Text("第二个页面"),
    );
  }
}
