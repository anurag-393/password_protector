import 'package:flutter/material.dart';

class NewPassword extends StatelessWidget {
  final Function addPassword;

  NewPassword(this.addPassword);
  final titleController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final websiteController = TextEditingController();

  void submitData(BuildContext context) {
    String title = titleController.text;
    String userName = userNameController.text;
    String password = passwordController.text;
    String website = websiteController.text;

    this.addPassword(
      title,
      userName,
      password,
      website,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Passowrd"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => submitData(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
                onSubmitted: (_) => submitData(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onSubmitted: (_) => submitData(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: websiteController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Website',
                ),
                onSubmitted: (_) => submitData(context),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                submitData(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
