//import 'package:classico/pages/signup_page.dart';
//import 'package:classico/pages/livingroom.dart';
//import 'package:classico/pages/kitchen.dart';
//import 'package:classico/pages/bedroom.dart';
//import 'package:classico/pages/homepage.dart';
//import 'package:classico/pages/signin_page.dart';
import 'package:classico/pages/testingpage.dart';
//import 'package:classico/pages/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:classico/pages/notification.dart';
//import 'package:classico/pages/notificationscreen.dart';
import 'package:flutter/material.dart';
//import 'package:classico/pages/bargraph.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: AndroidInitializationSettings(
//         'app_icon'), // Replace with your app's icon
//   );

//   // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//   //     onSelectNotification: (String payload) async {
//   //   // Handle notification tap
//   // });

//   runApp(MyApp());
// }

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
