import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Child 1",
          textAlign: TextAlign.center,
        ), Text(
          "Child 2",
          textAlign: TextAlign.center,
        ), Text(
          "Child 2",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
