import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AnimeRepository {
  Future<Either<Failure, List<Anime>>> list();
  Future<Either<Failure, Anime>> retrieve(int id);
}
