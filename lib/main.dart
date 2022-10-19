import 'package:flutter/material.dart';
import 'package:password_protector/models/password.dart';
import 'package:password_protector/widgets/passwordList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Password> passwords = [
    Password(
      id: "1",
      title: "Google",
      username: 'anurag01@gmail',
      password: "anuragd393",
      website: "google",
      date: DateTime.now(),
    ),
    Password(
      id: "2",
      title: "Google",
      username: 'anurag02@gmail',
      password: "anuragd393",
      website: "google",
      date: DateTime.now(),
    ),
    Password(
      id: "3",
      title: "Google",
      username: 'anurag03@gmail',
      password: "anuragd393",
      website: "google",
      date: DateTime.now(),
    ),
  ];

  void addPassword(String id, String title, String username, String pass,
      String website, DateTime date) {
    final password = new Password(
      id: id,
      title: title,
      username: username,
      password: pass,
      website: website,
      date: date,
    );
    setState(() {
      passwords.add(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Protecctor"),
      ),
      body: Column(
        children: [
          PasswordList(passwords),
        ],
      ),
    );
  }
}
