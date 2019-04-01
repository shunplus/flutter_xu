import 'package:flutter/material.dart';

void main() => runApp(new MyAppStateFul());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("标题")),
        body: Center(child: Text("hello world"),),
      ), //Scaffold
    ); //MaterialApp
  }
}

class MyAppStateFul extends StatefulWidget {
  @override
  _MyAppStateFulState createState() => new _MyAppStateFulState();
}


class _MyAppStateFulState extends State<MyAppStateFul> {
  var data = 1;
  Color c = const Color(0xFF42A5F5); //16进制的ARGB
  Color c2 = const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5);
  Color c3 = const Color.fromARGB(255, 66, 165, 245);
  Color c4 = const Color.fromRGBO(66, 165, 245, 1.0); //opacity：不透明度
  Color c5 = Colors.green;

  @override
  Widget build(BuildContext context) {
    ///封装了应用程序实现Material Design所需要的一些widget
    return new MaterialApp(

      ///Scaffold : Material Design布局结构的基本实现。
      home: Scaffold(

        ///ToolBar/ActionBar
        appBar: AppBar(title: new Text("首页"), centerTitle: true,),
        body: RaisedButton(
          onPressed: () {
            setState(() {
              data++;
            });
          },
          child: _TextBody("Hello Mr"),),
      ),
    );
  }

  //相当于Android 中设置textview 的style
  Widget _TextBody(String text) {
    return Padding(

      ///设置padding
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: Text(
        text,
        style: TextStyle(

          ///否继承父组件的属性，默认true，这个属性极少需要设置为false，设置为false字体默认为白色、10pixels
            inherit: true,

            ///字体颜色
            color: Colors.blue,

            ///粗细
            fontWeight: FontWeight.w500,

            /// 斜体
            fontStyle: FontStyle.italic,

            ///字母间距，默认0，负数间距越小，正数 间距越大
            letterSpacing: 5.0,

            ///underline：下划线，overline：上划线，lineThrough：删除线
            decoration: TextDecoration.underline,

            ///划线颜色
            decorationColor: Colors.black,

            ///solid：实线，double：双线，dotted：点虚线，dashed：横虚线，wavy：波浪线
            decorationStyle: TextDecorationStyle.wavy),),
    );
  }

  Widget _DefaultStyle() {
    DefaultTextStyle(
      //设置文本默认样式
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello Flutter!"),
          Text("Hello Flutter!"),
          Text("Hello Flutter!",
            style: TextStyle(
                inherit: false, //不继承默认样式
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }


}

