import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:password_protector/models/password.dart';
import 'package:password_protector/widgets/displayPassword.dart';

class PasswordList extends StatelessWidget {
  List<Password> passwords;

  PasswordList(
    this.passwords,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 660,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              onTap: () {
                Password password = this.passwords[index];
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          DisplayPassword(this.passwords[index].id, password)),
                );
              },
              leading: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(DateFormat.d().format(passwords[index].date)),
                    Text(DateFormat.MMM().format(passwords[index].date))
                  ],
                ),
              ),
              title: Text(passwords[index].title),
              subtitle: Text(passwords[index].username),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          );
        },
        itemCount: passwords.length,
      ),
    );
    // return Text(passwords[0].title);
  }
}
