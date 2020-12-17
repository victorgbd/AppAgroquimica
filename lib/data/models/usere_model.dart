// To parse this JSON data, do
//
//     final userEModel = userEModelFromJson(jsonString);

import 'package:agroquimica/data/entities/usere_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<UserEModel> userEModelFromJson(String str) =>
    List<UserEModel>.from(json.decode(str).map((x) => UserEModel.fromJson(x)));

String userEModelToJson(List<UserEModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserEModel extends UserEEntities {
  UserEModel({
    @required this.nombre,
    @required this.apellido,
    @required this.codcli,
    @required this.correo,
    @required this.contrasena,
    @required this.codpais,
    @required this.pais,
    @required this.codciudad,
    @required this.ciudad,
    @required this.coddir,
    @required this.direccion,
    @required this.tipo,
    @required this.numeracion,
    @required this.numerotelf,
    @required this.codusu,
  });

  final String nombre;
  final String apellido;
  final String codcli;
  final String correo;
  final String contrasena;
  final String codpais;
  final String pais;
  final String codciudad;
  final String ciudad;
  final String coddir;
  final String direccion;
  final String tipo;
  final String numeracion;
  final String numerotelf;
  final String codusu;

  factory UserEModel.fromJson(Map<String, dynamic> json) => UserEModel(
        nombre: json["nombre"],
        apellido: json["apellido"],
        codcli: json["codcli"],
        correo: json["correo"],
        contrasena: json["contrasena"],
        codpais: json["codpais"],
        pais: json["pais"],
        codciudad: json["codciudad"],
        ciudad: json["ciudad"],
        coddir: json["coddir"],
        direccion: json["direccion"],
        tipo: json["tipo"],
        numeracion: json["numeracion"],
        numerotelf: json["numerotelf"],
        codusu: json["codusu"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "codcli": codcli,
        "correo": correo,
        "contrasena": contrasena,
        "codpais": codpais,
        "pais": pais,
        "codciudad": codciudad,
        "ciudad": ciudad,
        "coddir": coddir,
        "direccion": direccion,
        "tipo": tipo,
        "numeracion": numeracion,
        "numerotelf": numerotelf,
        "codusu": codusu,
      };
}
