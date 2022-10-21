import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:password_protector/models/password.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayPassword extends StatelessWidget {
  final String id;
  final Password password;

  DisplayPassword(this.id, this.password);

  launchURLBrowser(BuildContext context) async {
    String url = this.password.website;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid URL"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Detials"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.symmetric(
                vertical: 70,
                horizontal: 30,
              ),
              child: Text(
                password.title,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "UserName",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              password.username,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.content_copy_outlined),
                              onPressed: () {
                                FlutterClipboard.copy(password.username).then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text("Copied"),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              password.password,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.content_copy_outlined),
                              onPressed: () {
                                FlutterClipboard.copy(password.password).then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text("Copied"),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Website",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              password.website,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.content_copy_outlined),
                              onPressed: () {
                                FlutterClipboard.copy(password.password).then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text("Copied"),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                launchURLBrowser(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
