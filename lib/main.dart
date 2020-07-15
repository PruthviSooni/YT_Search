import 'package:flutter/material.dart';

import 'screens/Home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(accentColor: Colors.deepOrange),
      debugShowCheckedModeBanner: true,
      home: Home(),
    );
  }
}
