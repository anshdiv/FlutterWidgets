import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:local_notifications/local_notifications.dart';

class FirebaseDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirebaseState();
  }
}


class FirebaseState extends State<FirebaseDemo> {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
  }


  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _createRecord,
              child: Text("Create Record"),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: _viewRecord,
              child: Text("View Record"),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: _updateRecord,
              child: Text("Update Record"),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: _deleteRecord,
              child: Text("Delete Record"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Firebase"),
      ),
    );
  }

  void _createRecord() {
    databaseReference.child("1").set({
      'title': 'Training Session',
      'description': 'Programming Guide for J2EE'
    });
    databaseReference.child("2").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
  }

  void _deleteRecord() {
    databaseReference.child('1').remove();
  }

  void _viewRecord() {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void _updateRecord() {
    databaseReference.child('1').update({
      'description': 'J2EE complete Reference'
    });
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        showNotification();
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }

  void showNotification(){
    LocalNotifications.createNotification(
        id: 0,
        title: 'Basic',
        content: 'some basic notification',
        androidSettings: new AndroidSettings(
          isOngoing: false,
          channel: channel,
          priority: AndroidNotificationPriority.HIGH,
        ),
        onNotificationClick: new NotificationAction(
            actionText: "some action",
            callback: removeNotify,
            payload: ""
        )
    );
  }


  static const AndroidNotificationChannel channel = const AndroidNotificationChannel(
    id: 'default_notification11',
    name: 'CustomNotificationChannel',
    description: 'Grant this app the ability to show notifications',
    importance: AndroidNotificationChannelImportance.HIGH,
    vibratePattern: AndroidVibratePatterns.DEFAULT,
  );

  void removeNotify(String payload) async {
    await LocalNotifications.removeNotification(0);
  }
}
