import 'package:flutter/material.dart';
import 'package:classico/pages/homepage.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({super.key});

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  bool plugSwitched = false;
  bool camSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Smart Home"),
        //centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "KITCHEN",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //
              SizedBox(
                height: 20,
              ),

              // Kitchen Photo

              Center(
                child: Image.asset(
                  "assets/kitchenph.jpg",
                  scale: 2.0,
                ),
              ),

              // Smart Plug Button

              const SizedBox(height: 18),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SMART PLUG',
                      style: TextStyle(
                        fontSize: 20,
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
                      value: plugSwitched,
                      onChanged: (value) {
                        setState(
                          () {
                            plugSwitched = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Camera Button

              const SizedBox(height: 5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      ' CAMERA        ',
                      style: TextStyle(
                        fontSize: 20,
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
                      value: camSwitched,
                      onChanged: (value) {
                        setState(
                          () {
                            camSwitched = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Go to Home Page

              const SizedBox(height: 5),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Back To Home",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],

            // Go to home page
          ),
        ),
      ),
    );
  }
}
