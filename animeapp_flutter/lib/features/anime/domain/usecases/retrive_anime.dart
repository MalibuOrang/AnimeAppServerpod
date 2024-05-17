import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:animeapp_flutter/core/usecases/usecase.dart';
import 'package:animeapp_flutter/features/anime/domain/repoisitories/anime_repository.dart';
import 'package:fpdart/fpdart.dart';

class RetrieveAnimeUseCase implements UseCase<Anime, RetrieveAnimeParams> {
  final AnimeRepository movieRepository;
  RetrieveAnimeUseCase(this.movieRepository);
  @override
  Future<Either<Failure, Anime>> call(RetrieveAnimeParams params) async {
    return await movieRepository.retrieve(params.id);
  }
}

class RetrieveAnimeParams {
  final int id;
  RetrieveAnimeParams({required this.id});
}
