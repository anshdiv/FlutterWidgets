import 'package:flutter/material.dart';

import '../constants.dart';
import 'fancy_button.dart';

class ScaffoldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.mail), title: Text("Messsage")),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text("Profile"))
      ]),
      appBar: AppBar(
        title: Text("Scaffold widget"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext buildContext) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: FancyButtonWidget(),

    );
  }

  void choiceAction(String action) {
    print(action);
  }
}
