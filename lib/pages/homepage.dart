import 'package:classico/pages/bedroom.dart';
import 'package:classico/pages/kitchen.dart';
import 'package:classico/pages/livingroom.dart';
import 'package:classico/pages/signin_page.dart';
import 'package:classico/pages/testingpage.dart';
import 'package:flutter/material.dart';
import 'package:classico/pages/bargraph.dart';
//import 'package:classico/pages/notification.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

// void main() {
//   runApp(const MyApp());
// }

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Alert Title'),
        content: Text('This is the content of your alert dialog.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

// Future<void> showNotification() async {
//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'your_channel_id',
//     'your_channel_name',
//     importance: Importance.max,
//     priority: Priority.high,
//     showWhen: false,
//   );

//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await flutterLocalNotificationsPlugin.show(
//     0, // Notification ID
//     'Notification Title',
//     'Notification Body',
//     platformChannelSpecifics,
//     payload:
//         'item x', // Optional, you can provide data to be passed when the notification is tapped
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //static const String route = '/home'; // Define the 'route' field

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
// final RemoteMessage? msg =
//         ModalRoute.of(context)!.settings.arguments as RemoteMessage?;

    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String route = '/home'; // Define the 'route' field

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/homeicon.png",
                        scale: 0.6,
                      ),
                    ),

                    //Smart Home Text

                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Smart Home',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //Rooms

                    const SizedBox(height: 100),
                    Row(
                      children: [
                        const Text(
                          '   ROOMS',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 200),

                        //Bar Graph
                        InkWell(
                          child: Image.asset(
                            "assets/stats.png",
                            scale: 1.4,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bargraph(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    //Room Icons

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                          title: 'LIVING ROOM',
                          icon: "assets/livingroom.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LivingRoom(),
                              ),
                            );
                          },
                        ),
                        _cardMenu(
                          title: 'KITCHEN',
                          icon: "assets/diningroom.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Kitchen(),
                              ),
                            );
                          },
                        ),
                        _cardMenu(
                          title: 'BED ROOM',
                          icon: "assets/bedroom.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BedRoom(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    // Night Mode Switch On/off

                    const SizedBox(height: 40),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'NIGHT MODE SWITCH',
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Switch(
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.white,
                              activeTrackColor: Colors.green,
                              inactiveTrackColor: Colors.red,
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              }),
                        ],
                      ),
                    ),

                    const SizedBox(height: 45),

                    //Sign Out Button & Alert Button

                    Center(
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                              );
                            },
                            child: Text(
                              " Log Out ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 90),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                minimumSize: Size(100, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                shadowColor: Colors.black),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TestingPage(),
                                ),
                              );
                            },
                            child: Text(
                              "   Test   ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Room Icon Class & Function
  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 19),
        width: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.black),
        child: Column(
          children: [
            Image.asset(icon),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
