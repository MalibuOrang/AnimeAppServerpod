import 'package:animeapp_flutter/core/widgets/loader.dart';
import 'package:animeapp_flutter/features/anime/presentation/bloc/anime_list/anime_list_bloc.dart';
import 'package:animeapp_flutter/features/anime/presentation/pages/anime_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AnimeListWidget extends StatefulWidget {
  const AnimeListWidget({super.key});

  @override
  State<AnimeListWidget> createState() => _AnimeListWidgetState();
}

class _AnimeListWidgetState extends State<AnimeListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<AnimeListBloc>().add(FetchAnimeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeListBloc, AnimeListState>(
      builder: (context, state) {
        switch (state) {
          case AnimeListStateInitial():
            return const SizedBox.shrink();
          case AnimeListStateLoading():
            return const LoaderWidget();
          case AnimeListStateFailure():
            return Center(
              child: Text(state.message),
            );
          case AnimeListStateSuccess():
            final animes = state.anime;
            return ListView.builder(
              itemCount: animes.length,
              itemBuilder: ((context, index) {
                final anime = animes[index];
                return Card(
                  child: ListTile(
                    title: Text(anime.title),
                    subtitle: Text("Released in ${anime.year}"),
                    onTap: () {
                      context.push(
                        AnimeDetailPage.route(anime.id),
                      );
                    },
                  ),
                );
              }),
            );
        }
      },
    );
  }
}
