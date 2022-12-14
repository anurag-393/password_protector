import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:password_protector/providers/authenticatinoProvider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:password_protector/models/password.dart';
import 'package:password_protector/widgets/pinAuthentication.dart';
import 'package:provider/provider.dart';

class DisplayPassword extends StatefulWidget {
  final String id;
  final Password password;

  DisplayPassword(this.id, this.password);

  // DisplayPassword(this.id, this.password, this.isAuthenticaed);

  @override
  _DisplayPasswordState createState() => _DisplayPasswordState();
}

class _DisplayPasswordState extends State<DisplayPassword> {
  bool isAuthenticated = false;

  // void authSuccess() {
  //   setState(() {
  //     isAuthenticated = true;
  //   });
  // }

  // void authFail() {
  //   isAuthenticated = true;
  // }

  launchURLBrowser(BuildContext context) async {
    String url = this.widget.password.website;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid URL"),
      ));
    }
  }

  void authentication(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return PinAuthentication(authSuccess: () {
            setState(() {
              isAuthenticated = true;
            });
          }, authFail: () {
            setState(() {
              isAuthenticated = false;
            });
          });
        });
  }

  String charToStar(int length) {
    var stars = '';
    for (var i = 0; i < length; i++) {
      stars += '* ';
    }
    return stars;
  }

  var passwordVisible = false;
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
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(
                vertical: 70,
                horizontal: 30,
              ),
              child: Text(
                widget.password.title,
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
                  widget.password.username.isEmpty
                      ? Container(
                          height: 0,
                        )
                      : Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Text(
                            "UserName",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                  widget.password.username.isEmpty
                      ? Container(
                          height: 0,
                        )
                      : Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    widget.password.username,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.content_copy_outlined),
                                    onPressed: () {
                                      FlutterClipboard.copy(
                                              widget.password.username)
                                          .then(
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
                  widget.password.password.isEmpty
                      ? Container(
                          height: 0,
                        )
                      : Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                  widget.password.password.isEmpty
                      ? Container(
                          height: 0,
                        )
                      : Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: this.isAuthenticated
                                        ? Text(
                                            widget.password.password,
                                            style: TextStyle(fontSize: 15),
                                          )
                                        : Text(
                                            charToStar(widget
                                                .password.password.length),
                                            style: TextStyle(fontSize: 15),
                                          )),
                                !isAuthenticated
                                    ? Expanded(
                                        child: ElevatedButton(
                                            child: Icon(Icons.view_agenda),
                                            onPressed: () {
                                              authentication(context);
                                            }),
                                      )
                                    : Expanded(
                                        child: ElevatedButton(
                                            child: Icon(Icons.view_agenda),
                                            onPressed: () {}),
                                      ),
                                // Expanded(
                                //   child: ElevatedButton(
                                //       child: Icon(Icons.view_agenda),
                                //       onPressed: () async {
                                //         bool isAuthenticated =
                                //             await Authentication
                                //                 .authenticateWithBiometrics();

                                //         if (isAuthenticated) {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => Test(),
                                //   ),
                                // );
                                //         } else {
                                //           ScaffoldMessenger.of(context)
                                //               .showSnackBar(SnackBar(
                                //             content: Text("Incorrect"),
                                //           ));
                                //         }
                                //       }),
                                // ),
                                // Expanded(
                                //   child: IconButton(
                                //     onPressed: () {
                                //       // Update the state i.e. toogle the state of passwordVisible variable
                                //       setState(() {
                                //         passwordVisible = !passwordVisible;
                                //       });
                                //     },
                                //     icon: Icon(
                                //       // Based on passwordVisible state choose the icon
                                //       passwordVisible
                                //           ? Icons.visibility
                                //           : Icons.visibility_off,
                                //     ),
                                //   ),
                                // ),

                                //                             onPressed: ()async {
                                // bool isAuthenticated =
                                //     await Authentication.authenticateWithBiometrics();

                                // if (isAuthenticated) {
                                //   Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //       builder: (context) => Test(),
                                //     ),
                                //   );
                                // } else {
                                //   ScaffoldMessenger.of(context)
                                //                                         .showSnackBar(
                                //                                       SnackBar(
                                //                                         content: Text("Copied"),
                                //                                       ));
                                // }
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.content_copy_outlined),
                                    onPressed: () {
                                      FlutterClipboard.copy(
                                              widget.password.password)
                                          .then(
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
                  widget.password.website.isEmpty
                      ? Container(
                          height: 0,
                        )
                      : Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Text(
                            "Website",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                  widget.password.website.isEmpty
                      ? Container(
                          height: 0,
                        )
                      : Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    widget.password.website,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.content_copy_outlined),
                                    onPressed: () {
                                      FlutterClipboard.copy(
                                              widget.password.password)
                                          .then(
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
