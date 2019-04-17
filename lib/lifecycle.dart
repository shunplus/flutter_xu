import 'package:flutter/material.dart';
import 'package:flutter_xu/util/event_bus.dart';

///生命周期
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _i;

  ///绘制界面，当setState触发的时候会再次被调用
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("导航"),),
        body: RaisedButton(onPressed: () {
          setState(() {
            _i++;
            EventBus.getDefault().post(_i); //发送EnentBus消息
          });
        }, child: Center(child: Text("点击我$_i"),),),
      ),
    );
  }

  ///当Widget第一次插入到Widget树时会被调用，对于每一个State对象，Flutter framework只会调用一次该回调
  @override
  void initState() {
    ///初始化
    super.initState();
    _i = 1;
    debugPrint("initState");
    EventBus.getDefault().register((int i) { //注册
      debugPrint("enent bus ${i}"); //接受消息打印
    });
  }


  ///当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void deactivate() {
    ///销毁
    super.deactivate();
    debugPrint("deactivate");
    EventBus.getDefault().unregister(); //销毁
  }
}

