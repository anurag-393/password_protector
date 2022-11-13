import 'package:flutter/material.dart';
import 'package:password_protector/models/password.dart';
import 'package:password_protector/providers/authenticatinoProvider.dart';
import 'package:password_protector/widgets/newPassword.dart';
import 'package:password_protector/widgets/passwordList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => CheckPin()),
    //   ],
    //   child: MyApp(),
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/a': (context) => MyHomePage(),
      },
      theme: ThemeData(
        primaryColor: Color(0xfff6c453),
        accentColor: Colors.black87,
        scaffoldBackgroundColor: Colors.grey[300],
      ),
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
  final List<Password> passwords = [];

  void addPassword(String title, String username, String pass, String website) {
    final password = new Password(
      id: "5",
      title: title,
      username: username,
      password: pass,
      website: website,
      date: DateTime.now(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            PasswordList(passwords),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewPassword(addPassword)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
