import 'package:animeapp_flutter/core/entities/user.dart';
import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:animeapp_flutter/core/usecases/usecase.dart';
import 'package:animeapp_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUserUseCase implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  const CurrentUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return authRepository.currentUser();
  }
}
