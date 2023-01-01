import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_pro/screen1.dart';
import 'package:my_pro/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

var user_name, pass_wd;

class spalshscr extends StatefulWidget {
  const spalshscr({Key? key}) : super(key: key);

  @override
  State<spalshscr> createState() => _spalshscrState();
}

class _spalshscrState extends State<spalshscr> {
  @override
  void initState() {
    usergetval();
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        checkingwhichscrtogo(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "M_pro",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> usergetval() async {
  final user = await SharedPreferences.getInstance();
  final saved_user = user.getString("username");
  user_name = saved_user;
}

// Future<void> passgetval() async {
//   final passwd = await SharedPreferences.getInstance();
//   final saved_passwd = passwd.getString("password");
//   pass_wd = saved_passwd;
// }

void checkingwhichscrtogo(BuildContext context) {
  if (user_name == null) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return const screen1();
        },
      ),
    );
  } else {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return const screen2();
        },
      ),
    );
  }
}
