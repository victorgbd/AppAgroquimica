import 'package:flutter/material.dart';

class UserEntities {
  UserEntities({
    @required this.nickname,
    @required this.contrasena,
    @required this.tipoacceso,
    @required this.codusuario,
  });
  final String nickname;
  final String contrasena;
  final String tipoacceso;
  final String codusuario;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserEntities &&
        o.nickname == nickname &&
        o.contrasena == contrasena &&
        o.tipoacceso == tipoacceso &&
        o.codusuario == codusuario;
  }

  @override
  int get hashCode {
    return nickname.hashCode ^
        contrasena.hashCode ^
        tipoacceso.hashCode ^
        codusuario.hashCode;
  }

  @override
  String toString() {
    return 'UserEntities(nickname: $nickname, contrasena: $contrasena, tipoacceso: $tipoacceso, codusuario: $codusuario)';
  }
}
