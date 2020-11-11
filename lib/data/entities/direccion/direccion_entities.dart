import 'package:flutter/material.dart';

class DireccionEntities {
  DireccionEntities({
    @required this.cod,
    @required this.descripcion,
  });

  final int cod;
  final String descripcion;
}

class DireccionesEntities {
  DireccionesEntities({
    @required this.descripcion,
    @required this.codciudad,
    @required this.codpais,
  });

  final String descripcion;
  final int codciudad;
  final int codpais;
}
