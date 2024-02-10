import 'package:flutter/material.dart';
import 'package:flutter_application_1/fall.dart';
import 'package:flutter_application_1/help.dart';
import 'package:flutter_application_1/quiz.dart';
import 'package:flutter_application_1/result.dart';
import 'welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()  async {
 await Hive.initFlutter();
 var box = await Hive.openBox('myBox');
runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      routes
      : {
        "/help" :(context) => const helpPage(),
        "/play" :(context) => const playPage(),
        "/home" :(context) => const WelcomePage(),
        "/result" :(context) => const resultPage(), 
        "/fall" :(context) => const fallpage(),  
      } ,
    );
  }
}