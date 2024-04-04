import 'package:dio/dio.dart';
import '../api/endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: Endpoints.baseURL));
  }

  static Future<Response> getData({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      uri,
      options: Options(headers: header),
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String uri,
    required var data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? query,
  }) async {
    return await dio.post(
      uri,
      queryParameters: query,
      options: Options(
        headers: header,
      ),
      data: data,
    );
  }

  static Future<Response> delData({
    required String uri,
    Map<String, dynamic>? data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? query,
  }) async {
    return await dio.delete(
      uri,
      queryParameters: query,
      options: Options(
        headers: header,
      ),
      data: data,
    );
  }
}
