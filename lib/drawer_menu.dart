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
                  icon: Icons.assignment,
                  text: 'Receitas',
                  onTap: () {
                    Navigator.of(context).pushNamed(Receita.tag);
                  }),
              Divider(),
              _createDrawerItem(
                icon: Icons.local_pharmacy,
                text: 'Remédios',
              ),
              Divider(),
              _createDrawerItem(
                icon: Icons.local_hospital,
                text: 'Médico',
              ),
              Divider(),
              _createDrawerItem(
                icon: Icons.exit_to_app,
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
    return UserAccountsDrawerHeader(
      accountName: Text('Moisés Coelho'),
      // accountEmail: Text('160002103@aluno.sj.unisal.br'),
      currentAccountPicture: CircleAvatar(
        child: Text('M', style: TextStyle(fontSize: 32)),
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
