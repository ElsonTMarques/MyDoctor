import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe{

  final String idReceita;
  final String remedio;
  final String descricaoRemedio;
  final String nomeDoutor;
  final String nomeHospital;
  final String tempoProximaDose;

  final String idUser;


  Recipe({
    this.idReceita,
    this.remedio,
    this.descricaoRemedio,
    this.nomeDoutor,
    this.nomeHospital,
    this.tempoProximaDose,

    this.idUser,
  });

  String getInitials() {
    if (remedio.isNotEmpty)
      return remedio.toUpperCase()[0];
    else
      return '?';
  }

  factory Recipe.fromDocument(DocumentSnapshot document) {
    return Recipe.fromMap(document.data);
  }

  factory Recipe.fromJson(String str) =>
      Recipe.fromMap(json.decode(str));

   factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
      idUser: json["idUser"] == null ? null : json["idUser"],
      remedio: json["remedio"] == null ? null : json["remedio"],
      descricaoRemedio: json["descricaoRemedio"] == null ? null : json["descricaoRemedio"],
      nomeDoutor: json["nomeDoutor"] == null ? null : json["nomeDoutor"],
      nomeHospital: json["nomeHospital"] == null ? null : json["nomeHospital"],
      tempoProximaDose: json["tempoProximaDose"] == null ? null : json["tempoProximaDose"],
      idReceita:
            json["idReceita"] == null ? null : json["idReceita"],
    );

      Map<String, dynamic> toMap() => {
        "idUser": idUser == null ? null : idUser,
        "remedio": remedio == null ? null : remedio,
        "descricaoRemedio": descricaoRemedio == null ? null : descricaoRemedio,
        "nomeDoutor": nomeDoutor == null ? null : nomeDoutor,
        "nomeHospital": nomeHospital == null ? null : nomeHospital,
        "tempoProximaDose": tempoProximaDose == null ? null : tempoProximaDose,
        "idReceita": idReceita == null ? null : idReceita,
      };

}