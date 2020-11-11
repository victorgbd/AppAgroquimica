// To parse this JSON data, do
//
//     final detallefactModel = detallefactModelFromJson(jsonString);

import 'package:agroquimica/data/entities/detallefact_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<DetallefactModel> detallefactModelFromJson(String str) =>
    List<DetallefactModel>.from(
        json.decode(str).map((x) => DetallefactModel.fromJson(x)));

String detallefactModelToJson(List<DetallefactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetallefactModel extends DetallefactEntities {
  DetallefactModel({
    @required this.numfac,
    @required this.codproducto,
    @required this.cantvent,
    @required this.precvent,
    @required this.coduni,
  });

  final int numfac;
  final int codproducto;
  final int cantvent;
  final double precvent;
  final int coduni;

  factory DetallefactModel.fromJson(Map<String, dynamic> json) =>
      DetallefactModel(
        numfac: json["numfac"],
        codproducto: json["codproducto"],
        cantvent: json["cantvent"],
        precvent: json["precvent"].toDouble(),
        coduni: json["coduni"],
      );

  Map<String, dynamic> toJson() => {
        "numfac": numfac,
        "codproducto": codproducto,
        "cantvent": cantvent,
        "precvent": precvent,
        "coduni": coduni,
      };
}
