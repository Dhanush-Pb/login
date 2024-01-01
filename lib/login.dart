import 'package:flutter/material.dart';
import 'package:login/home.dart';
import 'package:login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenlogin extends StatefulWidget {
  const Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _ScreenloginState();
}

class _ScreenloginState extends State<Screenlogin> {
  // ignore: non_constant_identifier_names
  final _UsernameController = TextEditingController();

  // ignore: non_constant_identifier_names
  final _PasswordController = TextEditingController();
  final _user = "dhanush";
  final _pass = "2255";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 2, 144),
        centerTitle: true,
        title: const Text(
          ' WELCOME TO TRAVALISM',
          style: TextStyle(
              fontSize: (19), color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _UsernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: 'Enter username',
                        labelText: 'username',
                      ),
                      validator: (value) {
                        //if (_isdataMatched) {
                        //return null;
                        //} else {
                        //return 'Error';
                        //}
                        if (value == null || value.isEmpty) {
                          return 'Enter the username !';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    controller: _PasswordController,
                    validator: (value) {
                      //if (_isdataMatched) {
                      //return null;
                      //} else {
                      //return 'Error';
                      //}
                      if (value == null || value.isEmpty) {
                        return 'Enter the password !';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Enter the password',
                      labelText: 'Password',

                      // validator:
                    ),
                  ),
                ),

                // SizedBox(
                // height: 20,
                //),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    checkLogin(context);
                    //
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _UsernameController.text;

    final _password = _PasswordController.text;
    if (_formkey.currentState!.validate()) {
      if (_username == _user && _password == _pass) {
        final _sharedprefs = await SharedPreferences.getInstance();
        _sharedprefs.setBool(SAVE_KEY_NAME, true);

        //  go to home
        //  print("match");
        Navigator.of(ctx).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const Screenhome()));
      } else {
        final _errormessege = 'username password doesnot match !!!';
        // snackbar
        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(20),
          content: Text(_errormessege),
          duration: const Duration(seconds: 2),
        ));

        // alert dialog

        // showDialog(
        //   context: ctx,
        // builder: (ctx1) {
        // return AlertDialog(
        // title: Text('Error'),
        //content: Text(_errormessege),
        //actions: [
        //TextButton(
        //onPressed: () {
        //Navigator.of(ctx1).pop();
        //},
        // child: Text('Close'),
        //)
        //],
        //);
        //});

        //show text
      }
    }
  }
}
