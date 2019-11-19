import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor{

  final String idDoutor;
  final String nomeDoutor;
  final String especialidade;
  final String hospitalResidente;


  Doctor({
    this.idDoutor,
    this.nomeDoutor,
    this.especialidade,
    this.hospitalResidente,
  });

  String getInitials() {
    if (nomeDoutor.isNotEmpty)
      return nomeDoutor.toUpperCase()[0];
    else
      return '?';
  }

  factory Doctor.fromDocument(DocumentSnapshot document) {
    return Doctor.fromMap(document.data);
  }

  factory Doctor.fromJson(String str) =>
      Doctor.fromMap(json.decode(str));

   factory Doctor.fromMap(Map<String, dynamic> json) => Doctor(
      idDoutor: json["idDoutor"] == null ? null : json["idDoutor"],
      nomeDoutor: json["nomeDoutor"] == null ? null : json["nomeDoutor"],
      especialidade: json["especialidade"] == null ? null : json["especialidade"],
      hospitalResidente: json["hospitalResidente"] == null ? null : json["hospitalResidente"],
    );

      Map<String, dynamic> toMap() => {
        "idDoutor": idDoutor == null ? null : idDoutor,
        "nomeDoutor": nomeDoutor == null ? null : nomeDoutor,
        "especialidade": especialidade == null ? null : especialidade,
        "hospitalResidente": hospitalResidente == null ? null : hospitalResidente,
      };

}