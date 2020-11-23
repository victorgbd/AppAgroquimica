// To parse this JSON data, do
//
//     final recomendacionModel = recomendacionModelFromJson(jsonString);

import 'package:agroquimica/data/entities/recomendacion/recomendacion_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<RecomendacionesModel> recomendacionesModelFromJson(String str) =>
    List<RecomendacionesModel>.from(
        json.decode(str).map((x) => RecomendacionesModel.fromJson(x)));

String recomendacionesModelToJson(List<RecomendacionesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecomendacionesModel extends RecomendacionesEntities {
  RecomendacionesModel({
    @required this.cod,
    @required this.descripcion,
  });

  final int cod;
  final String descripcion;

  factory RecomendacionesModel.fromJson(Map<String, dynamic> json) =>
      RecomendacionesModel(
        cod: json["cod"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "descripcion": descripcion,
      };
}
