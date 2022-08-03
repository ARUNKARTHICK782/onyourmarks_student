import 'package:flutter/material.dart';
import 'package:onyourmarks_student/models/TeacherModel.dart';

import '../API Handler/StudentsAPIs.dart';

class MyTeachers extends StatefulWidget {
  const MyTeachers({Key? key}) : super(key: key);

  @override
  State<MyTeachers> createState() => _MyTeachersState();
}

class _MyTeachersState extends State<MyTeachers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<TeacherModel>>(
        future: getMyTeachers(),
        builder: (BuildContext context,AsyncSnapshot<List<TeacherModel>> snapshot){
          List<Widget> children = [];
          if(snapshot.hasError){
            children=[
              Center(
                child: Text("Error"),
              )
            ];
          }
          else if(snapshot.hasData){
            children = [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context,int index){
                  return ExpansionTile(
                    title: Text(snapshot.data?.elementAt(index).name ?? ''),
                    children:[ Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(flex:2,child: Text("Name")),
                                Expanded(flex:4,child: Text(snapshot.data?.elementAt(index).name ?? " ")),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                            child: Row(
                              children: [
                                Expanded(flex:2,child: Text("Subject")),
                                Expanded(flex:4,child: Text(snapshot.data?.elementAt(index).subject_name ?? " ")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),]
                  );
                }),
              )
            ];
          }
          else{
            children = [
              Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading")
                  ],
                ),
              )
            ];
          }
          return Center(
            child: Column(
              children: children,
            ),
          );
        },
      )
    );
  }

  @override
  void initState() {
    //getMyTeachers();
  }
}
