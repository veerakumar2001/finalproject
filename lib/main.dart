import 'package:finalproject/mainscreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const project());
}
class project extends StatefulWidget {
  const project({Key? key}) : super(key: key);

  @override
  State<project> createState() => _projectState();
}

class _projectState extends State<project> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Mainscreen(),
    );
  }
}