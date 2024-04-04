import 'package:equatable/equatable.dart';

class LoginData extends Equatable {
  final UserData? user;
  final String? token;

  const LoginData({
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [
        user,
        token,
      ];
}

class UserData extends Equatable {
  final num? id;
  final String? name;
  final String? email;

  const UserData({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
      ];
}
