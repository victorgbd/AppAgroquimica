import 'package:flutter/material.dart';

class ImageEntities {
  ImageEntities({
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

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ImageEntities &&
        o.codplanta == codplanta &&
        o.planta == planta &&
        o.codespecie == codespecie &&
        o.especie == especie &&
        o.codenfer == codenfer &&
        o.enfermedad == enfermedad &&
        o.porc == porc;
  }

  @override
  int get hashCode {
    return codplanta.hashCode ^
        planta.hashCode ^
        codespecie.hashCode ^
        especie.hashCode ^
        codenfer.hashCode ^
        enfermedad.hashCode ^
        porc.hashCode;
  }
}
