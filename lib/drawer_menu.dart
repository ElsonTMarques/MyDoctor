import 'package:flutter/material.dart';
import 'package:my_doctor/receita.dart';

class DrawerMenu extends StatelessWidget {
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
                  icon: Icons.contacts,
                  text: 'Receitas',
                  onTap: () {
                    Navigator.of(context).pushNamed(Receita.tag);
                  }),
              _createDrawerItem(
                icon: Icons.contacts,
                text: 'Remédios',
              ),
              _createDrawerItem(
                icon: Icons.contacts,
                text: 'Médico',
              ),
              _createDrawerItem(
                icon: Icons.contacts,
                text: 'Sair',
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
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Color(0xffABCFF2),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  maxRadius: 35,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/default_person.jpg'),
                ),
              ),
              Text("Moisés Coelho",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900)),
            ]));
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
