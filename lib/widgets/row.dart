import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Text(
              "Child 1",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50.0),
            )),
            Expanded(
                child: Text(
              "Child 2",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50.0),
            )),
            Expanded(
                child: Text(
              "Child 3",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50.0),
            )),
          ],
        ),
      ),
    );
  }
}
