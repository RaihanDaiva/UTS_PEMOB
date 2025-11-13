import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard(title: "DAIVAKU")),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 40, 49, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          
          children: [
            // color: Colors.red,z
            // const Spacer(),
            Center(
              child: Text(
                "DAIVAKU",
                style: TextStyle(
                  color: Color.fromRGBO(238, 238, 238, 1),
                  fontSize: 50,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 250),
            Image.asset('assets/images/Profil.png', width: 100, height: 100),
            SizedBox(height: 10),


            Text(
              "Raihan Daiva D",
              style: TextStyle(
                fontFamily: 'Questrial',
                color: Color.fromRGBO(238, 238, 238, 1),
              ),
            ),

            Text(
              "15-2023-033",
              style: TextStyle(
                fontFamily: 'Questrial',
                color: Color.fromRGBO(238, 238, 238, 1),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
