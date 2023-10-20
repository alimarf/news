import 'package:news/core/usecases/usecases.dart';
import 'package:news/core/utils/typedefs.dart';

import '../repositories/auth_repo.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
