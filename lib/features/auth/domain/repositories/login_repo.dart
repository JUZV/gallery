import 'package:gallery/features/auth/domain/entities/login_data.dart';

abstract class LoginRepo {
  Future<LoginData?> login(String userId, String password);
}
