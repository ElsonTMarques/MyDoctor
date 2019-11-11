import 'package:flutter/material.dart';
import 'package:my_doctor/doctor_page.dart';
import 'package:my_doctor/home_page.dart';
import 'package:my_doctor/medicine_page.dart';
import 'package:my_doctor/register_page.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
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
      home: LoginPage(),
      routes: routes,
    );
  }
}
