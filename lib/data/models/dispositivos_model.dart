// To parse this JSON data, do
//
//     final dispositivoModel = dispositivoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<DispositivoModel> dispositivoModelFromJson(String str) => List<DispositivoModel>.from(json.decode(str).map((x) => DispositivoModel.fromJson(x)));

String dispositivoModelToJson(List<DispositivoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DispositivoModel {
    DispositivoModel({
        @required this.coddisp,
        @required this.descripcion,
        @required this.imei,
        @required this.codusu,
    });

    final String coddisp;
    final String descripcion;
    final String imei;
    final String codusu;

    factory DispositivoModel.fromJson(Map<String, dynamic> json) => DispositivoModel(
        coddisp: json["coddisp"],
        descripcion: json["descripcion"],
        imei: json["imei"],
        codusu: json["codusu"],
    );

    Map<String, dynamic> toJson() => {
        "coddisp": coddisp,
        "descripcion": descripcion,
        "imei": imei,
        "codusu": codusu,
    };
}
