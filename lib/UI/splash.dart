import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';
import 'guest_page.dart';

class SplashPic extends StatefulWidget {
  @override
  _SplashPicState createState() => _SplashPicState();
}

class _SplashPicState extends State<SplashPic> {
  initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => GestPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      color: Colors.green[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("assets/splashback.json")),
          Text(
            'EAIDAS',
            style: TextStyle(fontSize: 25, color: Colors.cyan.shade300),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
