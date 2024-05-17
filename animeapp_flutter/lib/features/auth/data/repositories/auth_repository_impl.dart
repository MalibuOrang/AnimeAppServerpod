import 'package:animeapp_flutter/core/entities/user.dart';
import 'package:animeapp_flutter/core/error/failure.dart';
import 'package:animeapp_flutter/core/exception/exception.dart';
import 'package:animeapp_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:animeapp_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  const AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Either<Failure, User> currentUser() {
    final user = dataSource.currentUser();
    if (user == null) {
      return left(const Failure("User not logged in"));
    }
    return right(user);
  }

  @override
  Future<Either<Failure, bool>> registerWithEmailPassword(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final success = await dataSource.registerWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      );
      if (success) {
        return right(true);
      }
      return left(const Failure("Could not register"));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> confirmRegistration({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final user = await dataSource.confirmRegistration(
        email: email,
        verificationCode: verificationCode,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
