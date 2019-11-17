import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/views/register_page.dart';

import 'home_page.dart';

class RootPage extends StatefulWidget {
  static String tag = 'root-page';
  @override
  _RootPageState createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return RegisterPage();
          }
          return HomePage();
        } else {
          return _showWaitingContainer();
        }
      },
    );
  }

  Widget _showWaitingContainer() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
