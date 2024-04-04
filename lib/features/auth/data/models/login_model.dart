import '../../domain/entities/login_data.dart';

class LoginDataModel extends LoginData {
  const LoginDataModel({
    required UserDataModel? user,
    required String? token,
  }) : super(
          user: user,
          token: token,
        );
  factory LoginDataModel.fromJson(Map<String, dynamic>? json) {
    return LoginDataModel(
      user: UserDataModel.fromJson(json?['user']),
      token: json?['token'],
    );
  }
}

class UserDataModel extends UserData {
  const UserDataModel({
    required num? id,
    required String? name,
    required String? email,
  }) : super(id: id, name: name, email: email);

  factory UserDataModel.fromJson(Map<String, dynamic>? json) {
    return UserDataModel(
        id: json?['id'], name: json?['name'], email: json?['email']);
  }
}
