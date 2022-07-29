import 'package:carapp/screens/loginscr.dart';
import 'package:carapp/screens/screen3.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.lightBlueAccent.shade400,
              Colors.blueAccent.shade100
            ]),
          ),
          child: Icon(
            Icons.logo_dev_sharp,
            size: 50,
          )
          // Image.asset("put your image here"),
          ),
    );
  }
}
