part of 'anime_retrieve_bloc.dart';

@immutable
sealed class AnimeRetrieveEvent {}

final class FetchAnimeEvent extends AnimeRetrieveEvent {
  final int id;

  FetchAnimeEvent({required this.id});
}
