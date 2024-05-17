import 'package:animeapp_flutter/core/entities/user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());
  void updateUser(User? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user));
    }
  }

  void logout() {
    updateUser(null);
  }
}
