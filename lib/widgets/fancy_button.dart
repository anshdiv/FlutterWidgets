import 'package:flutter/material.dart';

class FancyButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              onPressed: _onPressButton,
              fillColor: Colors.blue,
              splashColor: Colors.grey,
              shape: StadiumBorder(),
              padding: EdgeInsets.all(10.0),
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("INCREMENT", style: TextStyle(color: Colors.white)),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _onPressButton() {
    print("Button Clicked");
  }
}
