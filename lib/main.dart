import 'dart:js';

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff233316),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 40,
                  color: Colors.white,
                ),
                ToggleSwitch(
                  minWidth: 95.0,
                  minHeight: 45,
                  cornerRadius: 25.0,
                  activeBgColors: [
                    [Color(0xff334D20)],
                    [Color(0xff334D20)]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Color(0xff0A0D06),
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['노래', '동영상'],
                  fontSize: 16,
                  radiusStyle: true,
                ),
                Icon(
                  Icons.more_vert,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 1 / 12,
                  size.height * 1 / 10,
                  size.width * 1 / 10,
                  size.height * 1 / 10),
              child: Column(
                children: [
                  Image.asset("album.jpg"), // assets/
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 1 / 24,
                        size.height * 1 / 30,
                        size.width * 1 / 24,
                        size.height * 1 / 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Brand(feat. Layone)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "BE'O",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffB2B9AE),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
