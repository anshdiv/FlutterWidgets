import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      color: Colors.indigoAccent,
      child: Stack(
        children: <Widget>[
          Image.asset('assets/images/absence.png'),
          Text("Hello!!", style: TextStyle(backgroundColor: Colors.white))
        ],
      ),
    );
  }
}
