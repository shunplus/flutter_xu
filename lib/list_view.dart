import 'package:flutter/material.dart';

/**
 * 实现简单的ListView
 */
void main() => runApp(new ListViewApp());

class ListViewApp extends StatefulWidget {
  @override
  _ListViewAppState createState() => new _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("列表"),
          centerTitle: true,),
        body: _listViewHertical(),
      ),
    );
  }


  Widget _listViewHorizontal() {
    return new ListView(

      ///设置显示方式
      scrollDirection: Axis.horizontal,

      ///适合数量少的
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
            width: 100,
            child: Text("香蕉", style: TextStyle(color: Colors.green)),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
            width: 100,
            child: Text("苹果"),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
            width: 100,
            child: Text("梨"),),
        ),

      ],
    );
  }

  ///竖向较大数据
  Widget _listViewHertical() {
    List<String>items = new List<String>.generate(30, (i) => "Item $i");
    return new ListView.builder(
        itemBuilder: (context, i) {
          return Container(
            height: 80,
            child: Card(

              ///阴影效果 数字越大 效果越深
              elevation: 4.0,
              child: new ListTile(

                ///显示在title之前
                leading: new Image.asset('images/icon_yladfs.png'),
                subtitle: Text("subTitle${i}"),
                title: Text(items[i]),

                ///显示在最右边
                trailing: new Image.asset('images/right_arrow.png'),
              ),
            ),
          );
        });
  }
}
