import 'package:animeapp_flutter/features/app_user/presentation/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:animeapp_flutter/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUserDropdown extends StatelessWidget {
  const AppUserDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is! AppUserLoggedIn) {
          return const SizedBox();
        }
        return PopupMenuButton(
          itemBuilder: (contex) {
            return [
              PopupMenuItem(
                child: Text(state.user.username),
              ),
              PopupMenuItem(
                child: const Text("Logout"),
                onTap: () {
                  contex.read<AuthBloc>().add(AuthLogoutEvent());
                },
              )
            ];
          },
        );
      },
    );
  }
}
