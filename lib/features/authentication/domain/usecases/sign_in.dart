import 'package:equatable/equatable.dart';
import 'package:news/core/usecases/usecases.dart';
import 'package:news/core/utils/typedefs.dart';
import 'package:news/features/authentication/domain/entities/user.dart';
import 'package:news/features/authentication/domain/repositories/auth_repo.dart';

class SignIn extends UsecaseWithParams<LocalUser, SignInParams> {
  const SignIn(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call(SignInParams params) => _repo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  const SignInParams.empty()
      : email = '',
        password = '';

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
