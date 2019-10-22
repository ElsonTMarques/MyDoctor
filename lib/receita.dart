import 'package:flutter/material.dart';

class Receita extends StatelessWidget {
  static String tag = 'receita-page';

  @override
  Widget build(BuildContext context) {

    // final body = Container(
    //   width: MediaQuery.of(context).size.width,
    //   padding: EdgeInsets.all(28.0),
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(colors: [
    //       Colors.blue,
    //       Colors.lightBlueAccent,
    //     ]),
    //   ),
    // );

    final body = Container(
      child: _createMainList()
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Seja Bem-Vindo, Moisés"),
        backgroundColor: Color(0xffABCFF2),
      ),
      body: body,
    );
  }

  Widget _createMainList(){
    final titles = ['bike', 'boat', 'bus', 'car',
      'railway', 'run', 'subway', 'transit', 'walk'];

      final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

      return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(icons[index]),
              title: Text(titles[index], style: TextStyle(fontSize: 16),),
            ),
          );
        },
      );
  }

  
}
