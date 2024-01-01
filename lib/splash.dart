import 'package:flutter/material.dart';
import 'package:login/home.dart';
import 'package:login/login.dart';
import 'package:login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    checkUserloggedin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Loading...',
            style: TextStyle(fontSize: 35),
          ),
          Image.asset('lib/assets/travel.jpg'),
        ],
      )),
      //  Text(
      //  'Loading....',
      //style: TextStyle(fontSize: 35),
      //),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const Screenlogin(),
      ),
    );
  }

//it is second time direct go to home screen

  Future<void> checkUserloggedin() async {
    final _SharedPrefs = await SharedPreferences.getInstance();
    final _userloggedin = _SharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userloggedin == null || _userloggedin == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const Screenhome()));
    }
  }
}
