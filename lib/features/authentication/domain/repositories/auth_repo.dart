import 'package:news/core/utils/typedefs.dart';
import 'package:news/features/authentication/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();


  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String username,
    required String password, required fullName,
  });

  ResultFuture<void> forgotPassword(String email);
}