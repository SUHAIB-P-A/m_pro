import 'package:flutter/material.dart';
import 'package:my_pro/spalsh.dart';

main() {
  runApp(const My_App());
}


class My_App extends StatelessWidget {
  const My_App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: spalshscr(),
    );
  }
}