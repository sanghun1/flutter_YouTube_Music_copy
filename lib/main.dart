import 'package:flutter/material.dart';
import 'package:musicapp/screen/home.dart';
import 'package:musicapp/screen/sub.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (BuildContext context) => Home(),
        "/sub": (BuildContext context) => Sub(),
      },
    );
  }
}
