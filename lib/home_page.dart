import 'package:flutter/material.dart';
import 'package:my_doctor/drawer_menu.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final body = Container(child: _createMainList());

    return Scaffold(
      appBar: AppBar(
        title: Text("Seja Bem-Vindo, Moisés"),
        backgroundColor: Color(0xffABCFF2),
      ),
      drawer: DrawerMenu(),
      body: body,
    );
  }

  Widget _createMainList() {
    final titles = [
      'bike',
      'boat',
      'bus',
    ];

    final icons = [
      Icons.directions_bike,
      Icons.directions_boat,
      Icons.directions_bus,
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
                  ListTile(
                   leading: Icon(Icons.local_hospital, size: 70),
                    title: Text('Dipirona',
                        style: TextStyle(color: Colors.black)),
                    subtitle:
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Remédio para Dor de Cabeça',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              )
                            ),
                            Text(
                              'Dr Elsito Viadito',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                            Text(
                              ' - Hospital Copo Sujo',
                              style: TextStyle(
                                color: Colors.black,
                              )
                            ),
                            Divider(),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.watch_later,
                                ),
                                Text(
                                'Proxima Dose em 8h00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                )
                                ),
                              ],
                            ),
                            
                          ]
                        ),
                      ),
                  ),
                ],
              )
            )
        );
      },
    );
  }
}
