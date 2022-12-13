import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserWidget extends StatelessWidget {
  final Map user;
  UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user["picture"]["medium"]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(user["name"]["first"] + " " + user["name"]["last"])
            ],
          ),
        ),
      ),
    );
  }
}
