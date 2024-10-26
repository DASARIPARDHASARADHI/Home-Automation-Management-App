//import 'package:firebase_auth/firebase_auth.dart';
import 'package:classico/main.dart';
//import 'package:classico/pages/homepage.dart';
import 'package:classico/pages/homepage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void handleMessage(RemoteMessage? msg) {
  if (msg == null) return;

  navigatorKey.currentState?.pushNamed(
    HomePage.route,
    arguments: msg,
  );
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

Future<void> handleBackgroundMessage(RemoteMessage msg) async {
  print('Title: ${msg.notification?.title}');
  print('Body: ${msg.notification?.body}');
  print('Payload: ${msg.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token: $fCMToken");
    initPushNotifications();
  }
}
