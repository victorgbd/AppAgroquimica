import 'dart:io';

import 'package:agroquimica/data/entities/image_entities.dart';
import 'package:dartz/dartz.dart';

abstract class IImagesRepository {
  Future<Either<Failure, List<ImageEntities>>> getResult(File fileImage);
}

abstract class Failure {
  final String message;
  const Failure(
    this.message,
  );
}
