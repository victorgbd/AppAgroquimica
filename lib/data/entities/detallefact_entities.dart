import 'package:flutter/material.dart';

class DetallefactEntities {
  DetallefactEntities({
    @required this.numfac,
    @required this.codproducto,
    @required this.cantvent,
    @required this.precvent,
    @required this.coduni,
  });

  final int numfac;
  final int codproducto;
  final int cantvent;
  final double precvent;
  final int coduni;

  @override
  String toString() {
    return 'DetallefactEntities(numfac: $numfac, codproducto: $codproducto, cantvent: $cantvent, precvent: $precvent, coduni: $coduni)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DetallefactEntities &&
        o.numfac == numfac &&
        o.codproducto == codproducto &&
        o.cantvent == cantvent &&
        o.precvent == precvent &&
        o.coduni == coduni;
  }

  @override
  int get hashCode {
    return numfac.hashCode ^
        codproducto.hashCode ^
        cantvent.hashCode ^
        precvent.hashCode ^
        coduni.hashCode;
  }
}
