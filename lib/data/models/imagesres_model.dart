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
    @required this.planta,
    @required this.especie,
    @required this.enfermedad,
    @required this.porc,
  });

  final String planta;
  final String especie;
  final String enfermedad;
  final String porc;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        planta: json["planta"],
        especie: json["especie"],
        enfermedad: json["enfermedad"],
        porc: json["porc"],
      );

  Map<String, dynamic> toJson() => {
        "planta": planta,
        "especie": especie,
        "enfermedad": enfermedad,
        "porc": porc,
      };
}
