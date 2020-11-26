import 'package:meta/meta.dart';
import 'dart:convert';

Userflagmodel userflagmodelFromJson(String str) =>
    Userflagmodel.fromJson(json.decode(str));

String userflagmodelToJson(Userflagmodel data) => json.encode(data.toJson());

class Userflagmodel {
  Userflagmodel({
    @required this.flag,
  });

  final bool flag;

  factory Userflagmodel.fromJson(Map<String, dynamic> json) => Userflagmodel(
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "flag": flag,
      };
}
