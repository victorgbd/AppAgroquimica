// To parse this JSON data, do
//
//     final facturaModel = facturaModelFromJson(jsonString);

import 'package:agroquimica/data/entities/factura_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<FacturaModel> facturaModelFromJson(String str) => List<FacturaModel>.from(
    json.decode(str).map((x) => FacturaModel.fromJson(x)));

String facturaModelToJson(List<FacturaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FacturaModel extends FacturaEntities {
  FacturaModel({
    @required this.numfact,
    @required this.codcli,
    @required this.estado,
    @required this.tipfac,
    @required this.fecha,
    @required this.codemp,
    @required this.balance,
    @required this.total,
  });

  final int numfact;
  final int codcli;
  final int estado;
  final String tipfac;
  final DateTime fecha;
  final int codemp;
  final double balance;
  final double total;

  factory FacturaModel.fromJson(Map<String, dynamic> json) => FacturaModel(
        numfact: json["numfact"],
        codcli: json["codcli"],
        estado: json["estado"],
        tipfac: json["tipfac"],
        fecha: DateTime.parse(json["fecha"]),
        codemp: json["codemp"],
        balance: json["balance"].toDouble(),
        total: json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "numfact": numfact,
        "codcli": codcli,
        "estado": estado,
        "tipfac": tipfac,
        "fecha": fecha.toIso8601String(),
        "codemp": codemp,
        "balance": balance,
        "total": total,
      };
}
