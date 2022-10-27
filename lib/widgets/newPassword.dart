import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  final Function addPassword;

  NewPassword(this.addPassword);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final titleController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final websiteController = TextEditingController();

  bool submitted = false;

  void submitData() {
    String title = titleController.text;
    String userName = userNameController.text;
    String password = passwordController.text;
    String website = websiteController.text;

    setState(() => submitted = true);

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Title cannot be empty"),
        ),
      );
      return;
    }

    this.widget.addPassword(
          title,
          userName,
          password,
          website,
        );

    Navigator.of(context).pop();
  }

  String? get errorText {
    final text = titleController.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  var text = '';

  var passwordVisible = false; //This will obscure text dynamically

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Passowrd"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 60),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    focusedBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor)),
                    labelText: 'Title',
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(
                      Icons.title,
                      color: Colors.white,
                    ), // labelStyle: ,
                    errorText: submitted ? null : errorText,
                  ),
                  onChanged: (text) {
                    setState(() => text);
                  },
                  onSubmitted: (_) => submitData(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                    labelText: 'User Name',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.cyan,
                    ),
                  ),
                  onSubmitted: (_) => submitData(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: passwordController,
                  obscureText:
                      !passwordVisible, //This will obscure text dynamically
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.cyan,
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  onSubmitted: (_) => submitData(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: websiteController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                    labelText: 'Website',
                    prefixIcon: const Icon(
                      Icons.web,
                      color: Colors.cyan,
                    ),
                  ),
                  onSubmitted: (_) => submitData(),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                onPressed: () {
                  titleController.text.isEmpty ? null : submitData();
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
