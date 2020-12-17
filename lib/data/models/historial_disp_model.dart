import 'package:meta/meta.dart';
import 'dart:convert';

List<HistorialdispModel> historialdispModelFromJson(String str) =>
    List<HistorialdispModel>.from(
        json.decode(str).map((x) => HistorialdispModel.fromJson(x)));

String historialdispModelToJson(List<HistorialdispModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistorialdispModel {
  HistorialdispModel({
    @required this.codusu,
    @required this.fechaSes,
    @required this.coddisp,
    @required this.latitud,
    @required this.longitud,
  });

  final String codusu;
  final String fechaSes;
  final String coddisp;
  final String latitud;
  final String longitud;

  factory HistorialdispModel.fromJson(Map<String, dynamic> json) =>
      HistorialdispModel(
        codusu: json["codusu"],
        fechaSes: json["fecha_ses"],
        coddisp: json["coddisp"],
        latitud: json["latitud"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toJson() => {
        "codusu": codusu,
        "fecha_ses": fechaSes,
        "coddisp": coddisp,
        "latitud": latitud,
        "longitud": longitud,
      };
}
