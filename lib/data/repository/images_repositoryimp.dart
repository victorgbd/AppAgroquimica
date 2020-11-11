import 'dart:io';

import 'package:agroquimica/data/entities/image_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:agroquimica/data/repository/images_repository.dart';

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'package:agroquimica/data/models/imagesres_model.dart';

class ImagesRepositoryImp implements IImagesRepository {
  final http.Client httpClient;

  ImagesRepositoryImp({@required this.httpClient});
  final url = "";

  @override
  Future<Either<Failure, List<ImageEntities>>> getResult(File fileImage) async {
    try {
      var stream =
          http.ByteStream(DelegatingStream.typed(fileImage.openRead()));
      var length = await fileImage.length();

      var uri = Uri.parse("http://88fff366967e.ngrok.io/upload");

      var request = MultipartRequest("POST", uri);

      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: basename(fileImage.path),
      );

      request.files.add(multipartFile);

      StreamedResponse response = await request.send();
      if (response.statusCode != 200)
        return Left(const ImageAdminFailure(message: "Conexion Fallida"));

      var resp = await response.stream.transform(utf8.decoder).first;
      return Right(imageModelFromJson(resp));
    } catch (e) {
      return Left(const ImageAdminFailure(message: "Conexion Fallida"));
    }
  }
}

class ImageAdminFailure extends Failure {
  final String message;
  const ImageAdminFailure({this.message}) : super(message);
}
