import 'package:agroquimica/data/entities/user_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel extends UserEntities {
  UserModel({
    @required this.nickname,
    @required this.contrasena,
    @required this.tipoacceso,
    @required this.codusuario,
  });

  final String nickname;
  final String contrasena;
  final String tipoacceso;
  final String codusuario;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nickname: json["nickname"],
        contrasena: json["contrasena"],
        tipoacceso: json["tipoacceso"],
        codusuario: json["codusuario"],
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "contrasena": contrasena,
        "tipoacceso": tipoacceso,
        "codusuario": codusuario,
      };
}
