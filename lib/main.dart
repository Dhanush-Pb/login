import 'package:flutter/material.dart';
import 'package:login/splash.dart';


// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'USER LOGIN';
void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login Samble',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
     
    );
  }
}














 // routes: {
      //   ' screen_1': (ctx1) {
      //     return Screenhome();
      //   },
      

