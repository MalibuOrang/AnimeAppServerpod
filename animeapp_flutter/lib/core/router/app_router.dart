import 'package:animeapp_flutter/features/anime/presentation/pages/anime_list_page.dart';
import 'package:animeapp_flutter/features/anime/presentation/pages/anime_detail_page.dart';
import 'package:animeapp_flutter/features/app_user/presentation/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:animeapp_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: LoginPage.route(),
    routes: [
      GoRoute(
        path: LoginPage.route(),
        builder: (context, _) => const LoginPage(),
      ),
      GoRoute(
        path: AnimeListPage.route(),
        builder: (context, _) => const AnimeListPage(),
      ),
      GoRoute(
        path: AnimeDetailPage.route(),
        builder: (context, state) => AnimeDetailPage(
          animeId: int.parse(
            state.pathParameters['id'] ?? '0',
          ),
        ),
      )
    ],
    redirect: (context, state) {
      final userState = context.read<AppUserCubit>().state;
      final publicRoutes = [LoginPage.route()];
      if (!publicRoutes.contains(state.matchedLocation)) {
        if (userState is AppUserInitial) {
          return LoginPage.route();
        }
      }
      return null;
    },
  );
}
