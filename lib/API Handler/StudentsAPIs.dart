import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks_student/api/apiLink.dart';
import 'package:onyourmarks_student/models/MarksModel.dart';
import 'package:onyourmarks_student/models/TeacherModel.dart';

import '../models/ExamModel.dart';
import '../models/SubjectModel.dart';

Future<List<TeacherModel>> getMyTeachers() async{
  List<TeacherModel> teachers = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/student/myteachers/"+"62dd3885881d7ff0608758b6"),
    headers: {
        "x-auth-token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRkNDA4MWMwYjM3MDIyN2Q4YTFkMTkiLCJyb2xlIjoiU3R1ZGVudCIsImlhdCI6MTY1ODcyMTgwMn0.w1D29k5I6SiTTKpS-Kn1cbrYgJiJubQLxmBRSzLWxgo",
        "content-type" : "application/json"
    }
  );
  var teacher = json.decode(res.body);
  for(var i in teacher){
      TeacherModel teacher = TeacherModel.forStudents(i['teacher_id']['_id'], i['teacher_id']['name'], i['subject_id']['sub_name']);
      teachers.add(teacher);
  }
  return teachers;
  debugPrint(res.body);
}

getMyExams() async{
  List<ExamModel> exams = [];
  var res = await http.get(Uri.parse(apiLink.apilink+"api/student/myexams/"+"62dd3885881d7ff0608758b6"),
      headers: {
        "x-auth-token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRkNDA4MWMwYjM3MDIyN2Q4YTFkMTkiLCJyb2xlIjoiU3R1ZGVudCIsImlhdCI6MTY1ODcyMTgwMn0.w1D29k5I6SiTTKpS-Kn1cbrYgJiJubQLxmBRSzLWxgo",
        "content-type" : "application/json"
      }
  );
  debugPrint(res.body);
  var exam = json.decode(res.body);
  print("after exam");
  for(var i in exam) {
    print("i"+i.toString());
    if (!(i.toString() == "[]")) {
      int index = 0;
      List<SubjectModel> subjects = [];
      for (var k in i["exam_id"]["subjects"]) {
        SubjectModel sm = SubjectModel(
            k["_id"],
            k["sub_name"],
            k["total_marks"].toString(),
            i["exam_id"]["dates"][index++].toString()
        );
        subjects.add(sm);
      }
      ExamModel em = ExamModel(
          i["exam_id"]["_id"].toString(),
          i["exam_id"]["exam_name"].toString(),
          subjects,
          i["exam_id"]["status"]
      );
      exams.add(em);
      print(exams);
    }
  }
  return exams;
}

Future<Map<String, List<MarksModel>>> getMyMarks() async{
  Map<String,List<MarksModel>> map ={} ;
  var res = await http.get(Uri.parse(apiLink.apilink+"api/student/mymarks"),
      headers: {
        "x-auth-token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmRkNDA4MWMwYjM3MDIyN2Q4YTFkMTkiLCJyb2xlIjoiU3R1ZGVudCIsImlhdCI6MTY1ODcyMTgwMn0.w1D29k5I6SiTTKpS-Kn1cbrYgJiJubQLxmBRSzLWxgo",
        "content-type" : "application/json"
      }
  );
  debugPrint(res.body);
  var marks = json.decode(res.body);
  for(var i in marks){
    if(map.containsKey(i["exam_id"]["exam_name"])){
      map[i["exam_id"]["exam_name"]]?.add(new MarksModel(i["exam_id"]["_id"], i["exam_id"]["exam_name"], i["subject_id"]["sub_name"], i["subject_id"]["total_marks"].toString(), i["obtained"].toString()));
    }
    else{
      map.addAll({
        i["exam_id"]["exam_name"]:[new MarksModel(i["exam_id"]["_id"], i["exam_id"]["exam_name"], i["subject_id"]["sub_name"], i["subject_id"]["total_marks"].toString(), i["obtained"].toString())]
      });
    }
  }
  debugPrint("After models");
  return map;
}

