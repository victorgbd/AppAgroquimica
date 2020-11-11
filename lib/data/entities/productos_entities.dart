import 'package:flutter/material.dart';

class ProductosEntities {
  ProductosEntities(
      {@required this.codproducto,
      @required this.descripcion,
      @required this.codunidad,
      @required this.unidad,
      @required this.cantidad,
      @required this.precio,
      @required this.tipoprod,
      @required this.destipoprod,
      @required this.url,
      @required this.cantidadven});

  final String codproducto;
  final String descripcion;
  final String codunidad;
  final String unidad;
  String cantidad;
  final String precio;
  final String tipoprod;
  final String destipoprod;
  final String url;
  String cantidadven;
  setCantidadven(String cantidad) {
    this.cantidadven = cantidad;
  }
}
