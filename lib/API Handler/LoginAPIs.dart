import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onyourmarks_student/api/apiLink.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/UserModel.dart';

Future<UserModel> checkMe(String username, String password) async{
  var body = jsonEncode({
    "username" : username,
    "password" : password
  });
  var req = await http.post(
    Uri.parse("${apiLink.apilink}api/user/check"),
    headers:{
      "content-type":"application/json"
    },
    body: body
  );

  var res = jsonDecode(req.body);
  var um = UserModel(res["username"],res["user_id"],res["isAdmin"],res["isRegistered"]);

  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("token", req.headers['x-auth-token'].toString());

  return um;
}

Future<bool> changePassword(String username, String newPassword) async{
  var body = jsonEncode({
    "newPassword" : newPassword
  });
  
  var req = await http.put(
    Uri.parse("${apiLink.apilink}api/user/password/${username}"),
    headers:{
      "content-type":"application/json"
    },
    body: body
  );

  var res = jsonDecode(req.body);

  return res["isRegistered"];
}