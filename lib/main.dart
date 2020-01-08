import 'package:flutter/material.dart';
import 'package:form_with_focus_node/screens/first_screen.dart';
import 'package:form_with_focus_node/screens/second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form With Focus Node',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FirstScreen(),
      routes: {
        '/second-screen': (context) => SecondScreen(),
      },
    );
  }
}
