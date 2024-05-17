import 'dart:async';
import 'package:animeapp_flutter/features/app_user/presentation/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:animeapp_flutter/core/entities/user.dart';
import 'package:animeapp_flutter/core/usecases/usecase.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/current_user.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_confirm_registration.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_login.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_logout.dart';
import 'package:animeapp_flutter/features/auth/domain/usercases/user_register.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppUserCubit appUserCubit;
  final UserLoginUseCase userLogin;
  final UserLogoutUseCase userLogout;
  final UserRegisterUseCase userRegister;
  final UserConfirmRegistrationUseCase userConfirmRegistration;
  final CurrentUserUseCase currentUser;
  AuthBloc({
    required this.userLogin,
    required this.appUserCubit,
    required this.currentUser,
    required this.userLogout,
    required this.userRegister,
    required this.userConfirmRegistration,
  }) : super(AuthStateInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthStateLoading());
    });
    on<AuthIsUserLoggedInEvent>(_onAuthIsUserLoggedIn);
    on<AuthLoginEvent>(_onAuthLogin);
    on<AuthRegisterEvent>(_onAuthRegister);
    on<AuthConfirmRegisterEvent>(_onAuthConfirmRegistration);
    on<AuthLogoutEvent>(_onAuthLogout);
  }
  FutureOr<void> _onAuthRegister(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    final result = await userRegister(
      UserRegisterParams(
        email: event.email,
        password: event.password,
        username: event.password,
      ),
    );
    result.fold((failure) => emit(AuthStateFailure(failure.message)),
        (success) {
      if (success) {
        emit(
          AuthStateConfirmationRequired(
            email: event.email,
            password: event.password,
          ),
        );
      } else {
        emit(const AuthStateFailure("Could not register"));
      }
    });
  }

  FutureOr<void> _onAuthConfirmRegistration(
      AuthConfirmRegisterEvent event, Emitter<AuthState> emit) async {
    final result = await userConfirmRegistration(
      UserConfirmRegistrationParams(
        email: event.email,
        verificationCode: event.verificationCode,
        password: event.password,
      ),
    );
    result.fold((failure) => emit(AuthStateFailure(failure.message)),
        (user) => _emitAuthSucces(user, emit));
  }

  FutureOr<void> _onAuthLogin(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    final result = await userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthStateFailure(failure.message)),
      (user) => _emitAuthSucces(user, emit),
    );
  }

  FutureOr<void> _onAuthIsUserLoggedIn(
      AuthIsUserLoggedInEvent event, Emitter<AuthState> emit) async {
    final result = await currentUser(NoParams());
    result.fold(
      (failure) => emit(
        AuthStateFailure(failure.message),
      ),
      (user) => _emitAuthSucces(user, emit),
    );
  }

  FutureOr<void> _onAuthLogout(
      AuthLogoutEvent event, Emitter<AuthState> emit) async {
    final result = await userLogout(NoParams());
    result.fold((failure) => AuthStateFailure(failure.message), (_) {
      appUserCubit.logout();
      emit(AuthStateInitial());
    });
  }

  void _emitAuthSucces(User user, Emitter<AuthState> emit) {
    appUserCubit.updateUser(user);
    emit(AuthStateSuccess(user));
  }
}
