import 'package:flutter/material.dart';
import 'package:my_doctor/models/user.dart';
import 'package:my_doctor/services/auth.dart';
import 'package:my_doctor/views/doctor_page.dart';
import 'package:my_doctor/views/home_page.dart';
import 'package:my_doctor/views/login_page.dart';
import 'package:my_doctor/views/medicine_page.dart';

class DrawerMenu extends StatefulWidget{

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

  User _user = new User();

  @override
  void initState() {
    Auth.getUserLocal().then(_onGetUserLocalSuccess);
    super.initState();
  }

  void _onGetUserLocalSuccess(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _createDrawerList(context),
    );
  }

  Widget _createDrawerList(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: (size.width) - 90,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createHeader(),
              _createDrawerItem(
                  icon: Icons.assignment,
                  text: 'Receitas',
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(HomePage.tag);
                  }
              ),
              Divider(),
              _createDrawerItem(
                icon: Icons.local_pharmacy,
                text: 'Remédios',
                onTap: () {
                  Navigator.of(context).popAndPushNamed(Medicine.tag);
                }
              ),
              Divider(),
              _createDrawerItem(
                icon: Icons.local_hospital,
                text: 'Médico',
                onTap: () {
                  Navigator.of(context).popAndPushNamed(DoctorPage.tag);
                }
              ),
              Divider(),
              _createDrawerItem(
                icon: Icons.exit_to_app,
                text: 'Sair',
                onTap: () {
                  Auth.signOut();
                  Navigator.of(context).popAndPushNamed(LoginPage.tag);
                }
              ),
              ListTile(
                title: Text('0.0.1'),
                onTap: () {},
              ),
            ],
          ),
        ));
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(_user?.name ?? ""),
      accountEmail: Text(_user?.email ?? ""),
      currentAccountPicture: CircleAvatar(
        child: Text(_user?.getInitials() ?? '', style: TextStyle(fontSize: 32)),
        backgroundColor: Colors.grey,
      ),
      decoration: BoxDecoration(
        color: Color(0xffABCFF2),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
