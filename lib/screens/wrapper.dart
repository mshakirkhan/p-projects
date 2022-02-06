import 'package:flutter/material.dart';
import 'package:flutter_demo_project/models/user.dart';
import 'package:flutter_demo_project/screens/authenticate/authenticate.dart';
import 'package:flutter_demo_project/screens/home/quiz.dart';
import 'package:flutter_demo_project/services/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return either Quiz or Authentication

    return StreamBuilder<User?>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        User? user = snapshot.data;
        if (user == null) {
          return Authenticate();
        } else {
          print(user.uid);
          return Quiz();
        }
      },
    );
  }
}
