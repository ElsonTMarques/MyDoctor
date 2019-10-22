import 'package:flutter/material.dart';

class Receita extends StatelessWidget {
  static String tag = 'receita-page';

  @override
  Widget build(BuildContext context) {
    final body = Container(child: _createMainList());

    return Scaffold(
      appBar: AppBar(
        title: Text("Receitas"),
        backgroundColor: Color(0xffABCFF2),
      ),
      body: body,
    );
  }

  Widget _createMainList() {
    final titles = [
      'bike',
      'boat',
      'bus',
      // 'car',
      // 'railway',
      // 'run',
      // 'subway',
      // 'transit',
      // 'walk'
    ];

    final icons = [
      Icons.directions_bike,
      Icons.directions_boat,
      Icons.directions_bus,
      // Icons.directions_car,
      // Icons.directions_railway,
      // Icons.directions_run,
      // Icons.directions_subway,
      // Icons.directions_transit,
      // Icons.directions_walk
    ];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Container(
            width: 200,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album, size: 70),
                      title: Text('Dipirona',
                          style: TextStyle(color: Colors.black)),
                      subtitle:
                          Text('TWICE', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                )));
      },
    );
  }
}
