import 'dart:async';

import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/core/usecases/usecase.dart';
import 'package:animeapp_flutter/features/anime/domain/usecases/list_anime.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'anime_list_event.dart';
part 'anime_list_state.dart';

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final ListAnimeUseCase listAnime;
  AnimeListBloc({required this.listAnime}) : super(AnimeListStateInitial()) {
    on<AnimeListEvent>((_, emit) => emit(AnimeListStateLoading()));
    on<FetchAnimeEvent>(_onFetchMovies);
  }
  Future<void> _onFetchMovies(
      AnimeListEvent event, Emitter<AnimeListState> emit) async {
    final result = await listAnime.call(NoParams());
    result.fold(
      (failure) => emit(
        AnimeListStateFailure(failure.message),
      ),
      (anime) => emit(
        AnimeListStateSuccess(anime),
      ),
    );
  }
}
