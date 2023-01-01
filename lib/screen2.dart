import 'package:flutter/material.dart';
import 'package:my_pro/screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

var clearedpass;

class screen2 extends StatelessWidget {
  const screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar and logout button
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("screen2"),
        titleSpacing: 00.0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        elevation: 00.0,
        actions: [
          IconButton(
            onPressed: () {
              returntologin(context);
              if (clearedpass == null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return const screen1();
                    },
                  ),
                );
              }
            },
            icon: const Icon(Icons.power_settings_new),
            color: Colors.black,
            alignment: Alignment.topRight,
            iconSize: 40,
          ),
        ],
      ),
      //*****************************
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            InteractiveViewer(
              clipBehavior: Clip.none,
              minScale: 1,
              maxScale: 4,
              child: Image.asset("assect/images/football.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> returntologin(BuildContext context) async {
  final clearpass = await SharedPreferences.getInstance();
  final nullpass = clearpass.clear();
  clearedpass = nullpass;
}
