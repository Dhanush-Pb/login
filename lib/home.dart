import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenhome extends StatelessWidget {
  const Screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          'EXPLORE THE WORLD ',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                alert(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                subtitle: Text('Tour packege ${index + 1}'),
                title: Text(
                  'Destination ${index + 1}',
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w900),
                ),
                leading: avatar(index),
                trailing: Text('1 to $index day trip '),
              ),
          separatorBuilder: (context, index) => const Divider(
                thickness: 2,
              ),
          itemCount: 20),
    );
  }

  void alert(ctx) {
    showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            title: const Text('signout?'),
            actions: [
              TextButton(
                onPressed: () async {
                  final _sharedprefs = await SharedPreferences.getInstance();
                  await _sharedprefs.clear();

                  Navigator.of(ctx).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => const Screenlogin()),
                      (route) => false);
                },
                child: const Text('yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }

//imge aqre and circle

  Widget avatar(int index) {
    if (index % 2 == 0) {
      return const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            'https://img.freepik.com/premium-vector/traveler-logo-template-design-vector_714329-651.jpg'),
      );
    } else {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Image.network(
            'https://static8.depositphotos.com/1028652/1044/v/450/depositphotos_10444585-stock-illustration-hike-4.jpg'),
      );
    }
  }
}
