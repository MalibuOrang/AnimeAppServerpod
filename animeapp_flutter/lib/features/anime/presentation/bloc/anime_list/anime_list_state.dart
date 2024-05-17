part of 'anime_list_bloc.dart';

@immutable
sealed class AnimeListState {
  const AnimeListState();
}

final class AnimeListStateInitial extends AnimeListState {}

final class AnimeListStateLoading extends AnimeListState {}

final class AnimeListStateSuccess extends AnimeListState {
  final List<Anime> anime;
  const AnimeListStateSuccess(this.anime);
}

final class AnimeListStateFailure extends AnimeListState {
  final String message;
  const AnimeListStateFailure(this.message);
}
