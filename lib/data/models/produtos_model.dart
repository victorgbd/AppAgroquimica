// To parse this JSON data, do
//
//     final productosModel = productosModelFromJson(jsonString);

import 'package:agroquimica/data/entities/productos_entities.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductosModel> productosModelFromJson(String str) =>
    List<ProductosModel>.from(
        json.decode(str).map((x) => ProductosModel.fromJson(x)));

String productosModelToJson(List<ProductosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductosModel extends ProductosEntities {
  ProductosModel({
    @required this.codproducto,
    @required this.descripcion,
    @required this.codunidad,
    @required this.unidad,
    @required this.cantidad,
    @required this.precio,
    @required this.tipoprod,
    @required this.destipoprod,
    @required this.url,
  });

  final String codproducto;
  final String descripcion;
  final String codunidad;
  final String unidad;
  String cantidad;
  final String precio;
  final String tipoprod;
  final String destipoprod;
  final String url;

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        codproducto: json["codproducto"],
        descripcion: json["descripcion"],
        codunidad: json["codunidad"],
        unidad: json["unidad"],
        cantidad: json["cantidad"],
        precio: json["precio"],
        tipoprod: json["tipoprod"],
        destipoprod: json["destipoprod"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "codproducto": codproducto,
        "descripcion": descripcion,
        "codunidad": codunidad,
        "unidad": unidad,
        "cantidad": cantidad,
        "precio": precio,
        "tipoprod": tipoprod,
        "destipoprod": destipoprod,
        "url": url,
      };
}
