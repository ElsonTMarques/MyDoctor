import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/models/user.dart';

import 'package:my_doctor/services/auth.dart';
import 'package:my_doctor/views/login_page.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = new GlobalKey<FormState>();

  final _nameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();

  final _nameFocusNode = new FocusNode();
  final _emailFocusNode = new FocusNode();
  final _passwordFocusNode = new FocusNode();
  final _confirmPasswordFocusNode = new FocusNode();

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


    final sigInLabel = Text(
        'Cadastre-se no MyDoctor!',
        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),
    );

    return Scaffold(
      backgroundColor: Color(0xffABCFF2),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            sigInLabel,
            SizedBox(height: 48.0),
            _showNameTextField(),
            SizedBox(height: 20.0),
            _showEmailTextField(),
            SizedBox(height: 20.0),
            _showPasswordTextField(),
            SizedBox(height: 20.0),
            _showConfirmPasswordTextField(),
            SizedBox(height: 24.0),
            _showSignUpButton(),
            _backToLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _showEmailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
    );
  }

   Widget _showNameTextField() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nome',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
      textInputAction: TextInputAction.next,
      focusNode: _nameFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
    );
  }

  Widget _showPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
      textInputAction: TextInputAction.next,
      focusNode: _passwordFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
    );
  }

  Widget _showConfirmPasswordTextField() {
    return TextFormField(
      controller: _confirmPasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirmar senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white
      ),
      textInputAction: TextInputAction.next,
      focusNode: _confirmPasswordFocusNode,
    );
  }

   Widget _showSignUpButton(){
     return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          _signUp();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
      ),
    );
   }

   Widget _backToLoginButton(){
     return FlatButton(
      child: Text(
        'Ja é cadastrado? Faça o Login!',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
         Navigator.of(context).pushNamed(LoginPage.tag);
      },
    );
   }

   Future _signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signUp(email, password)
        .then(_onResultSignUpSuccess)
        .catchError((error) {
      Flushbar(
        title: 'Erro',
        message: error.toString(),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  void _onResultSignUpSuccess(String userId) {
    final email = _emailController.text;
    final name = _nameController.text;
    final user = User(userId: userId, name: name, email: email);
    Auth.addUser(user).then(_onResultAddUser);
  }

  void _onResultAddUser(result) {
    Flushbar(
      title: 'Novo usuário',
      message: 'Usuário registrado com sucesso!',
      duration: Duration(seconds: 2),
    )..show(context);
  }
}
