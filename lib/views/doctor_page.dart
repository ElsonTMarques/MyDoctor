import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/models/doctor.dart';
import 'package:my_doctor/models/user.dart';
import 'package:my_doctor/services/auth.dart';
import 'package:my_doctor/utils/common.dart';

class DoctorPage extends StatefulWidget{

  static String tag = 'doctor-page';
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {

  User _user;

  @override
  void initState() {
    super.initState();
    Auth.getUserLocal().then((user) {
      setState(() {
        _user = user;
      });
    });
  }
  

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
    if (_user == null) return Common.progressContainer();

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('doctor_objects')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Common.errorContainer(error: snapshot.error);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Common.progressContainer();
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data.documents.length == 0)
              return Common.emptyContainer(
                  message: "Nenhum objeto encontrado!");
            else
              return ListView(
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
  }

  Widget _buildCard(document){

    final doctorObject = Doctor.fromDocument(document);

    return Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person, size: 70),
            title: Text(doctorObject.nomeDoutor,
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
                      doctorObject.especialidade,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      )
                    ),
                    Text(
                      doctorObject.hospitalResidente,
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
    );
  }
}
