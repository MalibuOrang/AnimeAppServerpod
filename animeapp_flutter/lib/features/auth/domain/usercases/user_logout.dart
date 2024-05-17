import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:animeapp_flutter/core/usecases/usecase.dart';
import 'package:animeapp_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  const UserLogoutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.logout();
  }
}
