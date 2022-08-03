import 'package:flutter/material.dart';

class MyProfileStudent extends StatefulWidget {
  const MyProfileStudent({Key? key}) : super(key: key);

  @override
  State<MyProfileStudent> createState() => _MyProfileStudentState();
}

class _MyProfileStudentState extends State<MyProfileStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("My Profile"),
      ),
    );
  }
}
