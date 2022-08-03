import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onyourmarks_student/HomeScreen.dart';
import 'package:onyourmarks_student/Pages/App/LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        appId: "1:269652040859:android:49fa2700f8def261e1fa3e",
        messagingSenderId: "269652040859",
        projectId: "onyourmarks-60696",
        apiKey: 'AIzaSyD6WZ4OWlfjUrBw4B8d6tWJPWB23E6s114')
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}


