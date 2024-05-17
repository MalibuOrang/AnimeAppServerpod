import 'package:animeapp_flutter/features/anime/presentation/widgets/anime_list_widget.dart';
import 'package:animeapp_flutter/features/app_user/presentation/widgets/app_user_dropdown.dart';
import 'package:flutter/material.dart';

class AnimeListPage extends StatelessWidget {
  const AnimeListPage({super.key});
  static String route() => "/anime";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Anime'),
        ),
        actions: const [
          AppUserDropdown(),
        ],
      ),
      body: const AnimeListWidget(),
    );
  }
}
