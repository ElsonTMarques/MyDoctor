import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/models/recipe.dart';
import 'package:my_doctor/models/user.dart';
import 'package:my_doctor/services/auth.dart';
import 'package:my_doctor/utils/common.dart';
import 'package:my_doctor/views/drawer_menu.dart';

class HomePageDetail extends StatefulWidget{
  @override
  _HomePageDetailState createState() => _HomePageDetailState();
  static String tag = 'home-page-detail';
}


class _HomePageDetailState extends State<HomePageDetail> {

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
    final body = Container(child: _createMainList());

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe da receita"),
        backgroundColor: Color(0xffABCFF2),
      ),
      drawer: DrawerMenu(),
      body: body,
    );
  }

  Widget _createMainList() {
    if (_user == null) return Common.progressContainer();

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('recipe_objects')
          .where('idUser', isEqualTo: _user.userId)
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

    final recipeObject = Recipe.fromDocument(document);

    return Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title:
                 Text(recipeObject.nomeHospital,
                    style: TextStyle(color: Colors.black, fontSize: 19,fontWeight: FontWeight.w900,)),
                subtitle:
                  Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Divider(),
                        Text(
                          "Data de atendimento: 01/01/2019",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        Text(
                          "Paciente:  ${_user?.name ?? ""}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "Médico: ${recipeObject.nomeDoutor}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        Text(
                          "Especialidade:  Clinico Geral",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        Divider(),
                        Text(
                          "Remédio: ${recipeObject.remedio}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "AMOXILINA 500MG",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        Text(
                          "15 Comprimidos",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        Text(
                          "Tomar uma capsula a cada 12 horas",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          "@${recipeObject.nomeDoutor}",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w900,
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
