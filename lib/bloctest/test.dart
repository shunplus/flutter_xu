import 'package:flutter/material.dart';
import 'package:flutter_xu/bloctest/ui/login.dart';

class Test extends StatelessWidget {
  static const ROUT_NMAE = "/Test";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text(
            "Bloc",
            style: const TextStyle(color: Colors.white, fontSize: 17.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: new Login(),
      ),
    );
  }
}
