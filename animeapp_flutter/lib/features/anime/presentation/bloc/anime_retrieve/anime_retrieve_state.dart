part of 'anime_retrieve_bloc.dart';

@immutable
sealed class AnimeRetrieveState {
  const AnimeRetrieveState();
}

final class AnimeRetrieveStateInitial extends AnimeRetrieveState {}

final class AnimeRetrieveStateLoading extends AnimeRetrieveState {}

final class AnimeRetrieveStateSuccess extends AnimeRetrieveState {
  final Anime anime;
  const AnimeRetrieveStateSuccess(this.anime);
}

final class AnimeRetrieveStateFailure extends AnimeRetrieveState {
  final String message;
  const AnimeRetrieveStateFailure(this.message);
}
