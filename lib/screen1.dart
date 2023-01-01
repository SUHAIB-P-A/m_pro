import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_pro/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _usercontroller = TextEditingController(text: " ");
var _passcontroller = TextEditingController(text: " ");
var userName;

class screen1 extends StatelessWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _usercontroller.text = " ";
    _passcontroller.text = " ";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: const Text(
          "M_pro",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        elevation: 00.0,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(30),
            children: [
              const Text(
                "log in",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //username filling field
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: _usercontroller,
                  validator: (value) {
                    if (value == null) print("fill the value");
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "username",
                    hintText: "type your username",
                    icon: Icon(Icons.person),
                  ),
                ),
              ),
              //password filling field
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) print("fill the value");
                  },
                  obscureText: true,
                  controller: _passcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password",
                      hintText: "type your password",
                      icon: Icon(Icons.vpn_key)),
                ),
              ),

              //proceed button
              ElevatedButton(
                onPressed: () {
                  if ((_usercontroller.text == _passcontroller.text) &&
                      ((_passcontroller.text != " ") &&
                          (_usercontroller.text != " "))) {
                    printdata();
                    getdata();
                  }
                  // if (userName == null) {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (ctx) {
                  //         return screen1();
                  //       },
                  //     ),
                  //   );
                  // }

                  if ((_usercontroller.text == _passcontroller.text) &&
                      ((_usercontroller.text != " ") &&
                          (_passcontroller.text != " "))) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const screen2();
                        },
                      ),
                    );
                  } else if (_usercontroller.text != _passcontroller.text) {
                    var snackBar = SnackBar(
                      content: Text("wrong input"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text("proceed"),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  visualDensity: VisualDensity.standard,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(
                        color: Colors.red,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> printdata() async {
  print(_usercontroller.text);
  print(_passcontroller.text);

//save data

  final shareduser = await SharedPreferences.getInstance();
  await shareduser.setString("username", _usercontroller.text);

  // final sharedpass = await SharedPreferences.getInstance();
  // await sharedpass.setString("password", _passcontroller.text);
}

//stored value getting func(n)
Future<void> getdata() async {
  final user = await SharedPreferences.getInstance();
  final save_user = user.getString("username");
  userName = save_user;
  // final passwd = await SharedPreferences.getInstance();
  // final save_pass = passwd.getString("password");
}
