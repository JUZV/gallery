import 'package:gallery/core/network/network_info.dart';
import 'package:gallery/core/util/constants.dart';
import 'package:gallery/features/auth/data/datasources/login_data_source.dart';
import 'package:gallery/features/auth/domain/entities/login_data.dart';
import 'package:gallery/features/auth/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final NetworkInfo networkInfo;
  final LoginDataSource loginDataSource;
  LoginRepoImpl({
    required this.networkInfo,
    required this.loginDataSource,
  });
  @override
  Future<LoginData?> login(String userId, String password) async {
    if (await networkInfo.isConnected) {
      final loginData = await loginDataSource.login(userId, password);
      return loginData;
    } else {
      Constants.showToast(msg: 'please check your connection');
    }
  }
}
