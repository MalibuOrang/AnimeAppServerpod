import 'package:animeapp_flutter/features/app_user/presentation/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:animeapp_flutter/core/router/app_router.dart';
import 'package:animeapp_flutter/dependencies.dart';
import 'package:animeapp_flutter/features/anime/presentation/bloc/anime_list/anime_list_bloc.dart';
import 'package:animeapp_flutter/features/anime/presentation/bloc/anime_retrieve/anime_retrieve_bloc.dart';
import 'package:animeapp_flutter/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>()
            ..add(
              AuthIsUserLoggedInEvent(),
            ),
        ),
        BlocProvider(create: (_) => serviceLocator<AnimeListBloc>()),
        BlocProvider(create: (_) => serviceLocator<AnimeRetrieveBloc>()),
      ],
      child: const AnimeTitlesApp(),
    ),
  );
}

class AnimeTitlesApp extends StatelessWidget {
  const AnimeTitlesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserCubit, AppUserState>(
      listener: (context, state) {
        AppRouter.router.refresh();
      },
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        title: "Clean Serverpod",
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
