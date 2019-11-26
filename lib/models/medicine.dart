import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineObject{

  final String apresentacao;
  final String classeTerapeutica;
  final String codigoGgrem;
  final String ean1;

  final String laboratorio;
  final String pfSImposto;
  final String principioAtivo;
  final String produto;

  final String regimePreco;
  final String registro;
  final String tarja;
  final String tipoProduto;


  MedicineObject({
    this.apresentacao,
    this.classeTerapeutica,
    this.codigoGgrem,
    this.ean1,
    this.laboratorio,
    this.pfSImposto,
    this.principioAtivo,
    this.produto,
    this.regimePreco,
    this.registro,
    this.tarja,
    this.tipoProduto,
  });

  String getInitials() {
    if (produto.isNotEmpty)
      return produto.toUpperCase()[0];
    else
      return '?';
  }

  factory MedicineObject.fromDocument(DocumentSnapshot document) {
    return MedicineObject.fromMap(document.data);
  }

  factory MedicineObject.fromJson(String str) =>
      MedicineObject.fromMap(json.decode(str));

   factory MedicineObject.fromMap(Map<String, dynamic> json) => MedicineObject(
      apresentacao: json["apresentacao"] == null ? null : json["apresentacao"],
      classeTerapeutica: json["classeTerapeutica"] == null ? null : json["classeTerapeutica"],
      codigoGgrem: json["codigoGgrem"] == null ? null : json["codigoGgrem"],
      ean1: json["ean1"] == null ? null : json["ean1"],

      laboratorio: json["laboratorio"] == null ? null : json["laboratorio"],
      pfSImposto: json["pfSImposto"] == null ? null : json["pfSImposto"],
      principioAtivo: json["principioAtivo"] == null ? null : json["principioAtivo"],
      produto: json["produto"] == null ? null : json["produto"],

      regimePreco: json["regimePreco"] == null ? null : json["regimePreco"],
      registro: json["registro"] == null ? null : json["registro"],
      tarja: json["tarja"] == null ? null : json["tarja"],
      tipoProduto: json["tipoProduto"] == null ? null : json["tipoProduto"],
    );

      Map<String, dynamic> toMap() => {
        "apresentacao": apresentacao == null ? null : apresentacao,
        "classeTerapeutica": classeTerapeutica == null ? null : classeTerapeutica,
        "codigoGgrem": codigoGgrem == null ? null : codigoGgrem,
        "ean1": ean1 == null ? null : ean1,

        "laboratorio": laboratorio == null ? null : laboratorio,
        "pfSImposto": pfSImposto == null ? null : pfSImposto,
        "principioAtivo": principioAtivo == null ? null : principioAtivo,
        "produto": produto == null ? null : produto,

        "regimePreco": regimePreco == null ? null : regimePreco,
        "registro": registro == null ? null : registro,
        "tarja": tarja == null ? null : tarja,
        "tipoProduto": tipoProduto == null ? null : tipoProduto,
        
      };

}