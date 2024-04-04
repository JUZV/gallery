import 'package:dio/dio.dart';
import 'package:gallery/core/util/cache_helper.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/network/dio_helper.dart';
import '../models/login_model.dart';

abstract class LoginDataSource {
  Future<LoginDataModel> login(String user, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginDataModel> login(
    String user,
    String password,
  ) async {
    Response value = await DioHelper.postData(
      uri: Endpoints.loginEndpoint,
      data: {
        "email": user,
        "password": password,
      },
    );
    return LoginDataModel.fromJson(value.data);
  }
}
