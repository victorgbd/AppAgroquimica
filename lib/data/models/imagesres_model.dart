// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'package:agroquimica/data/entities/image_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<ImageModel> imageModelFromJson(String str) =>
    List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String imageModelToJson(List<ImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel extends ImageEntities {
  ImageModel({
    @required this.codplanta,
    @required this.planta,
    @required this.codespecie,
    @required this.especie,
    @required this.codenfer,
    @required this.enfermedad,
    @required this.porc,
  });

  final String codplanta;
  final String planta;
  final String codespecie;
  final String especie;
  final String codenfer;
  final String enfermedad;
  final String porc;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        codplanta: json["codplanta"],
        planta: json["planta"],
        codespecie: json["codespecie"],
        especie: json["especie"],
        codenfer: json["codenfer"],
        enfermedad: json["enfermedad"],
        porc: json["porc"],
      );

  Map<String, dynamic> toJson() => {
        "codplanta": codplanta,
        "planta": planta,
        "codespecie": codespecie,
        "especie": especie,
        "codenfer": codenfer,
        "enfermedad": enfermedad,
        "porc": porc,
      };
}
