import 'package:flutter/material.dart';

class ImageEntities {
  ImageEntities({
    @required this.planta,
    @required this.especie,
    @required this.enfermedad,
    @required this.porc,
  });

  final String planta;
  final String especie;
  final String enfermedad;
  final String porc;

  @override
  String toString() {
    return 'ImageEntities(planta: $planta, especie: $especie, enfermedad: $enfermedad, porc: $porc)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ImageEntities &&
        o.planta == planta &&
        o.especie == especie &&
        o.enfermedad == enfermedad &&
        o.porc == porc;
  }

  @override
  int get hashCode {
    return planta.hashCode ^
        especie.hashCode ^
        enfermedad.hashCode ^
        porc.hashCode;
  }
}
