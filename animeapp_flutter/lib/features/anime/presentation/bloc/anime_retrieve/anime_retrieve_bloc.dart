import 'dart:async';
import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/features/anime/domain/usecases/retrive_anime.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'anime_retrieve_event.dart';
part 'anime_retrieve_state.dart';

class AnimeRetrieveBloc extends Bloc<AnimeRetrieveEvent, AnimeRetrieveState> {
  final RetrieveAnimeUseCase retrieveAnime;
  AnimeRetrieveBloc({required this.retrieveAnime})
      : super(AnimeRetrieveStateInitial()) {
    on<AnimeRetrieveEvent>((_, emit) => emit(AnimeRetrieveStateLoading()));
    on<FetchAnimeEvent>(_onFetchMovies);
  }
  Future<void> _onFetchMovies(
      FetchAnimeEvent event, Emitter<AnimeRetrieveState> emit) async {
    final result = await retrieveAnime.call(RetrieveAnimeParams(id: event.id));
    result.fold(
      (failure) => emit(
        AnimeRetrieveStateFailure(failure.message),
      ),
      (anime) => emit(
        AnimeRetrieveStateSuccess(anime),
      ),
    );
  }
}
