import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks_student/Pages/CCA/CCAForm.dart';
import 'package:onyourmarks_student/Pages/Profile/ProfileStudent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'API Handler/profileAPIs.dart';
import 'Pages/CCA/MyCCA.dart';
import 'Pages/Chat/ChatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Home Page"),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileStudent()));
              }, child: Text("Profile")
            ),
            TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentCCAForm()));
              }, child: Text("CCA Form")
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCCA()));
            }, child: Text("My CCA")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.chat_bubble_text_fill),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>mychats()));
        },
      ),
    );
  }

  @override
  void initState() {
    meFunc();
  }
}
