import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:password_protector/models/password.dart';

class PasswordList extends StatelessWidget {
  List<Password> passwords;

  PasswordList(
    this.passwords,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: ListTile(
              leading: Text(passwords[index].id),
              title: Text(passwords[index].title),
            ),
          );
        },
        itemCount: passwords.length,
      ),
    );
    // return Text(passwords[0].title);
  }
}
