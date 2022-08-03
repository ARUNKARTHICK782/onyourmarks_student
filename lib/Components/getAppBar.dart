
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks_student/models/CCAModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar getAppBar(BuildContext context, String title){
  return AppBar(
    title: Text(title, style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(CupertinoIcons.back),
      onPressed: (){
        Navigator.pop(context);
      },
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}

Expanded getExpanded(int flex, Widget child){
  return Expanded(
      flex: flex,
      child: child
  );
}

ListView populateExamsObjectToListView(BuildContext context, List<CCAModel> activities, String type){
  var color = (type == "pending")
      ?Colors.blue
      :(type == "accepted")
      ?Colors.green
      :Colors.amber;
  return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          // onTap: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => ExamDetailsView(exams.elementAt(index),color)));
          // },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0,left: 18.0,right: 18.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: getTheStyledTextForExamsList(activities.elementAt(index).name.toString(),20)),
                          Expanded(
                              flex: 1,
                              child: Text("")
                          ),
                          Expanded(
                            flex: 3,
                              child: getTheStyledTextForExamsList(activities.elementAt(index).status.toString(),20))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: getTheStyledTextForExamsList("Type : ", 15),
                        ),
                        getTheStyledTextForExamsList(activities.elementAt(index).type ?? ' ', 15),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: getTheStyledTextForExamsList("Status : ", 15),
                        ),
                        getTheStyledTextForExamsList(activities.elementAt(index).isVerified ?? ' ', 15)
                      ],
                    )
                  ],
                ),
              ),
              color: color,
            ),
          ),
        );

      }
      , separatorBuilder: (BuildContext context, int index){
    return SizedBox(
      height: 20,
    );
  }
      , itemCount: activities.length);
}

Text getTheStyledTextForExamsList(String? field, double fontSize){
  return Text(field ?? ' ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: fontSize),);
}

Future<String> getToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.get("token").toString();
}


