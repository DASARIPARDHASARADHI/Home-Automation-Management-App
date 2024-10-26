import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  //static const route = '/notification-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Push Notifications",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('${msg?.notification?.title ?? 'No title'}'),
            // Text('${msg?.notification?.body ?? 'No body'}'),
            // Text('${msg?.data ?? 'No data'}'),
          ],
        ),
      ),
    );
  }
}
