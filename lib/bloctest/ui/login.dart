import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new LoginSate();
  }
}

class LoginSate extends StatefulWidget {
  @override
  _LoginSateState createState() => _LoginSateState();
}

class _LoginSateState extends State<LoginSate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: new Text("点击获取"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
