import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:animeapp_flutter/core/usecases/usecase.dart';
import 'package:animeapp_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserRegisterUseCase implements UseCase<bool, UserRegisterParams> {
  final AuthRepository authRepository;

  UserRegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(UserRegisterParams params) async {
    return await authRepository.registerWithEmailPassword(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}

class UserRegisterParams {
  final String email;
  final String password;
  final String username;

  UserRegisterParams({
    required this.email,
    required this.password,
    required this.username,
  });
}
