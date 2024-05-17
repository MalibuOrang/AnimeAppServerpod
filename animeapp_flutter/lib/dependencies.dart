import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/features/app_user/presentation/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:animeapp_flutter/features/anime/data/datasources/anime_datasource.dart';
import 'package:animeapp_flutter/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:animeapp_flutter/features/anime/domain/repoisitories/anime_repository.dart';
import 'package:animeapp_flutter/features/anime/domain/usecases/list_anime.dart';
import 'package:animeapp_flutter/features/anime/domain/usecases/retrive_anime.dart';
import 'package:animeapp_flutter/features/anime/presentation/bloc/anime_list/anime_list_bloc.dart';
import 'package:animeapp_flutter/features/anime/presentation/bloc/anime_retrieve/anime_retrieve_bloc.dart';
import 'package:animeapp_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:animeapp_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:animeapp_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/current_user.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_confirm_registration.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_login.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_logout.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_register.dart';
import 'package:animeapp_flutter/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton<AppUserCubit>(
    () => AppUserCubit(),
  );
  serviceLocator.registerLazySingleton<Client>(
    () => Client(
      "http://192.168.1.118:8080/",
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor(),
  );
  serviceLocator.registerLazySingleton<SessionManager>(
    () => SessionManager(caller: serviceLocator<Client>().modules.auth),
  );
  await serviceLocator<SessionManager>().initialize();
  _initAuth();
  _initAnime();
}

void _initAuth() {
  //Data Source
  serviceLocator.registerFactory<AuthDataSource>(
    () => AuthDataSourceImpl(
      serviceLocator<Client>(),
      serviceLocator<SessionManager>(),
    ),
  );
  //Repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator<AuthDataSource>(),
    ),
  );
  //UseCases
  serviceLocator.registerFactory<UserLoginUseCase>(
    () => UserLoginUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );
  serviceLocator.registerFactory<CurrentUserUseCase>(
    () => CurrentUserUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );
  serviceLocator.registerFactory<UserRegisterUseCase>(
    () => UserRegisterUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );
  serviceLocator.registerFactory<UserConfirmRegistrationUseCase>(
    () => UserConfirmRegistrationUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );
  serviceLocator.registerFactory<UserLogoutUseCase>(
    () => UserLogoutUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );
  //Blocs
  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      appUserCubit: serviceLocator<AppUserCubit>(),
      userLogin: serviceLocator<UserLoginUseCase>(),
      currentUser: serviceLocator<CurrentUserUseCase>(),
      userLogout: serviceLocator<UserLogoutUseCase>(),
      userRegister: serviceLocator<UserRegisterUseCase>(),
      userConfirmRegistration: serviceLocator<UserConfirmRegistrationUseCase>(),
    ),
  );
}

void _initAnime() {
  //Repository
  serviceLocator.registerFactory<AnimeDatasource>(
    () => AnimeDatasourceImp(
      serviceLocator<Client>(),
    ),
  );
  serviceLocator.registerFactory<AnimeRepository>(
    () => AnimeRepositoryImpl(
      serviceLocator<AnimeDatasource>(),
    ),
  );
  //UseCases
  serviceLocator.registerFactory<ListAnimeUseCase>(
    () => ListAnimeUseCase(
      serviceLocator<AnimeRepository>(),
    ),
  );
  serviceLocator.registerFactory<RetrieveAnimeUseCase>(
    () => RetrieveAnimeUseCase(
      serviceLocator<AnimeRepository>(),
    ),
  );
  //Blocs
  serviceLocator.registerLazySingleton(
    () => AnimeListBloc(
      listAnime: serviceLocator<ListAnimeUseCase>(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AnimeRetrieveBloc(
      retrieveAnime: serviceLocator<RetrieveAnimeUseCase>(),
    ),
  );
}
