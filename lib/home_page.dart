import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Alucard',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Seja Bem-Vindo, Moisés"), backgroundColor: Color(0xffABCFF2),),
      body: body,
      drawer: _createDrawerList(context),
    );
  }

  Widget _createDrawerList(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.width) - 90,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(icon: Icons.contacts,text: 'Receitas',),
            _createDrawerItem(icon: Icons.contacts,text: 'Remédios',),
            _createDrawerItem(icon: Icons.contacts,text: 'Médico',),
            _createDrawerItem(icon: Icons.contacts,text: 'Sair',),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      )
    );
  }

  Widget _createHeader() 
  {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Color(0xffABCFF2),
      ),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 100.0,
            top: 70.0,
            child: Text("Moisés Coelho",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w900
                )
            ),
        ),
        Positioned(
            bottom: 50.0,
            left: 16.0,
            child: CircleAvatar(
              maxRadius: 35,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/default_person.jpg'),
            ),
        ),
      ]
      )
    );
  }

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) 
  {
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
