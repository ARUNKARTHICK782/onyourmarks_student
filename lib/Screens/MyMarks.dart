import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onyourmarks_student/API%20Handler/StudentsAPIs.dart';
import 'package:onyourmarks_student/Screens/MarksScreen.dart';
import 'package:onyourmarks_student/Screens/SubjectsScreen.dart';
import 'package:onyourmarks_student/models/MarksModel.dart';

class MyMarks extends StatefulWidget {
  const MyMarks({Key? key}) : super(key: key);

  @override
  State<MyMarks> createState() => _MyMarksState();
}

class _MyMarksState extends State<MyMarks> {
  Map<String,List<MarksModel>> map = {};
  List<String> exam_names = [];
  fetchingMarks() async{
    await getMyMarks().then((value) {
      map = value;
      for(var i in map.keys){
        exam_names.add(i);
      }
      debugPrint(exam_names.toString());
      setState(() {

      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(itemBuilder: (BuildContext context,int index){
              return GestureDetector(
                child: Card(
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(exam_names.elementAt(index),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MarksScreen(map[exam_names.elementAt(index)])));
                },
              );
            }, separatorBuilder: (BuildContext context,int index){
              return SizedBox(height: 10,);
            }, itemCount: exam_names.length),
          ),
        ],
      )
    );
  }

  @override
  void initState() {
    fetchingMarks();
  }
}
