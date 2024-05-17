import 'package:animeapp_flutter/core/utils/show_snackbar.dart';
import 'package:animeapp_flutter/core/widgets/loader.dart';
import 'package:animeapp_flutter/features/anime/presentation/bloc/anime_retrieve/anime_retrieve_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AnimeDetailPage extends StatefulWidget {
  static String route([int? animeId]) => "/anime/${animeId ?? ':id'}";
  final int animeId;
  const AnimeDetailPage({super.key, required this.animeId});

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<AnimeRetrieveBloc>().add(FetchAnimeEvent(id: widget.animeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeRetrieveBloc, AnimeRetrieveState>(
      listener: (context, state) {
        if (state is AnimeRetrieveStateFailure) {
          showSnackbar(context, state.message);
          context.pop();
        }
      },
      builder: (context, state) {
        switch (state) {
          case AnimeRetrieveStateLoading():
            return const Scaffold(
              body: LoaderWidget(),
            );
          case AnimeRetrieveStateFailure():
            return Scaffold(
              body: Center(
                child: Text(state.message),
              ),
            );
          case AnimeRetrieveStateInitial():
            return const Scaffold(
              body: SizedBox(),
            );
          case AnimeRetrieveStateSuccess():
            final anime = state.anime;
            return Scaffold(
              appBar: AppBar(
                title: Text(anime.title),
              ),
              body: Center(
                child: Column(
                  children: [
                    Text("Released ${anime.year}"),
                    Text("Directory ${anime.directorName}"),
                    Text("Logline: ${anime.logline}"),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
