import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onyourmarks_student/Components/getAppBar.dart';
import 'package:onyourmarks_student/api/apiLink.dart';

import '../models/CCAModel.dart';

postActivity(String id,String actName, String actType, String status, String start, String end) async{
  var token = await getToken();

  var body = json.encode({
    "activity_name":actName,
    "activity_type":actType,
    "status":status,
    "startDate":start,
    "endDate":end,
    "isVerified":"pending",
    "student_id": id
  });
  await http.post(
    Uri.parse("${apiLink.apilink}api/student/cca"),
    headers: {
      "x-auth-token":token,
      "content-type":"application/json"
    },
    body: body
  )
  .then((value){
    debugPrint("Posted");
  })
  .catchError((err) {
    debugPrint("UnExpected Error$err");
  });
}

Future<List<CCAModel>> getMyActivities() async{
  var token = await getToken();

  List<CCAModel> activities = [];
  
  var req = await http.get(
    Uri.parse(apiLink.apilink+"api/student/mycca/All"),
    headers: {
      "x-auth-token":token,
    }
  );

  var response = jsonDecode(req.body);

  for(var i in response){
    CCAModel activity = CCAModel.fromJson(i);
    activities.add(activity);
  }
  
  return activities;
}