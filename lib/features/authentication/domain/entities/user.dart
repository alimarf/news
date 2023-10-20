// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  final String uid;
  final String email;
  final String username;

  const LocalUser({
    required this.uid,
    required this.email,
    required this.username,
  });

  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          username: '',
        );

  @override
  List<Object> get props => [uid, email, username];
}
