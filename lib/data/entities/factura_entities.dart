import 'package:flutter/material.dart';

class FacturaEntities {
  FacturaEntities({
    @required this.numfact,
    @required this.codcli,
    @required this.estado,
    @required this.tipfac,
    @required this.fecha,
    @required this.codemp,
    @required this.balance,
    @required this.total,
  });

  final int numfact;
  final int codcli;
  final int estado;
  final String tipfac;
  final DateTime fecha;
  final int codemp;
  final double balance;
  final double total;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FacturaEntities &&
        o.numfact == numfact &&
        o.codcli == codcli &&
        o.estado == estado &&
        o.tipfac == tipfac &&
        o.fecha == fecha &&
        o.codemp == codemp &&
        o.balance == balance &&
        o.total == total;
  }

  @override
  int get hashCode {
    return numfact.hashCode ^
        codcli.hashCode ^
        estado.hashCode ^
        tipfac.hashCode ^
        fecha.hashCode ^
        codemp.hashCode ^
        balance.hashCode ^
        total.hashCode;
  }
}
