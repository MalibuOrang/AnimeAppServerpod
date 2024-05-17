part of 'anime_list_bloc.dart';

@immutable
sealed class AnimeListEvent {}

final class FetchAnimeEvent extends AnimeListEvent {}
