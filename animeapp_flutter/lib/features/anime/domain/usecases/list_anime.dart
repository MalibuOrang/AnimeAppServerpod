import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:animeapp_flutter/core/usecases/usecase.dart';
import 'package:animeapp_flutter/features/anime/domain/repoisitories/anime_repository.dart';
import 'package:fpdart/fpdart.dart';

class ListAnimeUseCase implements UseCase<List<Anime>, NoParams> {
  final AnimeRepository movieRepository;
  ListAnimeUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<Anime>>> call(NoParams params) async {
    return await movieRepository.list();
  }
}
