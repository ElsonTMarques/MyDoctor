import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/services/auth.dart';
import 'package:my_doctor/views/register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

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

    return Scaffold(
      backgroundColor: Color(0xffABCFF2),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            _showEmailTextField(),
            SizedBox(height: 8.0),
            _showPasswordTextField(),
            SizedBox(height: 24.0),
            _showSignInButton(),
            _showRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _showEmailTextField(){
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
    );
  }

  Widget _showPasswordTextField(){
    return TextField(
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
    );
  }

  Widget _showSignInButton(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          _signIn();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _showRegisterButton(){
    return FlatButton(
      child: Text(
        'Cadastre-se',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
         Navigator.of(context).pushNamed(RegisterPage.tag);
      },
    );
  }

  Future<void> _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signIn(email, password)
        .then(_onSignInSuccess)
        .catchError((error) {
      print('Caught error: $error');
      Flushbar(
        title: 'Ocorreu um erro',
        message: showHandleMessages(error.code),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  Future _onSignInSuccess(String userId) async {
    final user = await Auth.getUser(userId);
    await Auth.storeUserLocal(user);
    Navigator.pushReplacementNamed(context, HomePage.tag);
  }

  String showHandleMessages(String errorCode){
    if(errorCode == "ERROR_INVALID_EMAIL"){ // ERROR_EMAIL_ALREADY_IN_USE < tem q tratar
      return "Formato de e-mail inválido";
    }

    if(errorCode == "ERROR_USER_NOT_FOUND"){
      return "E-mail ou senha inválidos";
    }

    if(errorCode == "ERROR_WRONG_PASSWORD"){
      return "E-mail ou senha inválidos";
    }

    return "Houve um erro desconhecido";
  }
}
