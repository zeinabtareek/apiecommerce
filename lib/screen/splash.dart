import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {

SplashScreen splashScreen=Get.put(SplashScreen());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff465bd8),
      body: Center(
        child: Text(
          "Welcome...",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
