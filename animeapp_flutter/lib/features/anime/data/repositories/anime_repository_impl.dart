import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:animeapp_flutter/core/exception/exception.dart';
import 'package:animeapp_flutter/features/anime/data/datasources/anime_datasource.dart';
import 'package:animeapp_flutter/features/anime/domain/repoisitories/anime_repository.dart';
import 'package:fpdart/fpdart.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeDatasource datasource;
  AnimeRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<Anime>>> list() async {
    try {
      return right(await datasource.list());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Anime>> retrieve(int id) async {
    try {
      return right(await datasource.retrieve(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
