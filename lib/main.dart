import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/screen/home.dart';
import 'package:musicapp/screen/sub.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      // routes: {
      //   "/home": (BuildContext context) => Home(),
      //   "/sub": (BuildContext context) => Sub(),
      // },
      getPages: [
        GetPage(name: "/home", page: () => Home()),
        GetPage(name: "/sub", page: () => Sub()),
      ],
    );
  }
}
