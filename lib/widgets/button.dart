import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonWidgetState();
  }
}

class ButtonWidgetState extends State<ButtonWidget> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$_counter"),
            RaisedButton(
              color: Colors.blue,
              onPressed: _onPressButton,
              child: Text("INCREMENT",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

  void _onPressButton() {
    setState(() {
      _counter++;
    });
  }
}
