import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_widgets/models/usermodel.dart';
import 'package:flutter_widgets/constants.dart';
import 'dart:convert';

class CustomListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomListState();
  }
}

class CustomListState extends State<CustomListViewWidget> {
  Future<List<UserModel>> _getUsers() async {
    var data = await http.get(Constants.JSONURL);
    var jsonData = json.decode(data.body);
    List<UserModel> users = [];
    for (var i in jsonData) {
      UserModel userModel = UserModel(i["first"], i["last"], i["picture"]);
      users.add(userModel);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomList"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext buildContext, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data[index].picture),
                      ),
                      title: Text("${snapshot.data[index].first} ${snapshot.data[index].last}"),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
