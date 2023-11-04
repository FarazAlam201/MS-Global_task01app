import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task1_app/screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.png',
            width: 120,
          ),
          Text(
            'Lorem',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text('IPSUM', style: Theme.of(context).textTheme.displayMedium)
        ]),
      ),
    );
  }
}
