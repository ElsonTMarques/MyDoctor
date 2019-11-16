import 'package:flutter/material.dart';
import 'package:my_doctor/login_page.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final emailLabel = Text(
        'E-mail',
        style: TextStyle(color: Colors.black),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
    );

    final passwordLabel = Text(
        'Senha',
        style: TextStyle(color: Colors.black),
    );

    final sigInLabel = Text(
        'Cadastre-se no MyDoctor!',
        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
      ),
    );

    final loginLabel = FlatButton(
      child: Text(
        'Ja é cadastrado? Faça o Login!',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
         Navigator.of(context).pushNamed(LoginPage.tag);
      },
    );

    return Scaffold(
      backgroundColor: Color(0xffABCFF2),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            sigInLabel,
            SizedBox(height: 48.0),
            emailLabel,
            email,
            SizedBox(height: 8.0),
            passwordLabel,
            password,
            SizedBox(height: 24.0),
            registerButton,
            loginLabel,
          ],
        ),
      ),
    );
  }
}
