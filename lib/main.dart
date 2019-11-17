import 'package:flutter/material.dart';
import 'package:my_doctor/views/doctor_page.dart';
import 'package:my_doctor/views/home_page.dart';
import 'package:my_doctor/views/medicine_page.dart';
import 'package:my_doctor/views/register_page.dart';
import 'package:my_doctor/views/login_page.dart';
import 'package:my_doctor/views/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    RootPage.tag: (context) => RootPage(),
    LoginPage.tag: (context) => LoginPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    HomePage.tag: (context) => HomePage(),
    Medicine.tag: (context) => Medicine(),
    DoctorPage.tag: (context) => DoctorPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDoctor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: RootPage(),
      routes: routes,
    );
  }
}
