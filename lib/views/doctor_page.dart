import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  static String tag = 'doctor-page';

  @override
  Widget build(BuildContext context) {
    final body = Container(child: _createMainList());

    return Scaffold(
      appBar: AppBar(
        title: Text("Médicos"),
        backgroundColor: Color(0xffABCFF2),
      ),
      body: body,
    );
  }

  Widget _createMainList() {

    final titles = [
      'Elsito Viadito',
      'Matheus O. Chuponga',
      'Lismarita Chatarita',
      'Matheus Faltaras',
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
                   leading: Icon(Icons.person, size: 70),
                    title: Text(titles[index],
                        style: TextStyle(
                          color: Colors.black, 
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          )
                        ),
                    subtitle:
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Clinico Geral',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              )
                            ),
                            Text(
                              'Hospital Copo Sujo',
                              style: TextStyle(
                                color: Colors.black,
                              )
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
