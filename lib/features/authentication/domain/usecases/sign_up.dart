// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:news/core/usecases/usecases.dart';
import 'package:news/core/utils/typedefs.dart';
import 'package:news/features/authentication/domain/repositories/auth_repo.dart';

class SignUp extends UsecaseWithParams<void, SignUpParams> {
  final AuthRepo _repo;

  SignUp(this._repo);

  @override
  ResultFuture<void> call(SignUpParams params) => _repo.signUp(
        email: params.email,
        username: params.username,
        password: params.password,
        fullName: params.fullName,
      );
}

class SignUpParams extends Equatable {
  final String fullName;
  final String username;
  final String email;
  final String password;

  const SignUpParams({
    required this.username,
    required this.email,
    required this.password,
    required this.fullName,
  });

  const SignUpParams.empty()
      : this(
          email: '',
          password: '',
          username: '',
          fullName: '',
        );

  @override
  List<Object> get props => [username, email, password, fullName];
}
