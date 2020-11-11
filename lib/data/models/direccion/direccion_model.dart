import 'package:agroquimica/data/entities/direccion/direccion_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<DireccionModel> direccionModelFromJson(String str) =>
    List<DireccionModel>.from(
        json.decode(str).map((x) => DireccionModel.fromJson(x)));

String direccionModelToJson(List<DireccionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DireccionModel extends DireccionEntities {
  DireccionModel({
    @required this.cod,
    @required this.descripcion,
  });

  final int cod;
  final String descripcion;

  factory DireccionModel.fromJson(Map<String, dynamic> json) => DireccionModel(
        cod: json["cod"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "descripcion": descripcion,
      };
}
// To parse this JSON data, do
//
//     final direccionesModel = direccionesModelFromJson(jsonString);

List<DireccionesModel> direccionesModelFromJson(String str) =>
    List<DireccionesModel>.from(
        json.decode(str).map((x) => DireccionesModel.fromJson(x)));

String direccionesModelToJson(List<DireccionesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DireccionesModel extends DireccionesEntities {
  DireccionesModel({
    @required this.descripcion,
    @required this.codciudad,
    @required this.codpais,
  });

  final String descripcion;
  final int codciudad;
  final int codpais;

  factory DireccionesModel.fromJson(Map<String, dynamic> json) =>
      DireccionesModel(
        descripcion: json["descripcion"],
        codciudad: json["codciudad"],
        codpais: json["codpais"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "codciudad": codciudad,
        "codpais": codpais,
      };
}
