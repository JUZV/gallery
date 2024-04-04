import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gallery/core/api/endpoints.dart';
import 'package:gallery/core/util/cache_helper.dart';
import 'package:gallery/features/app/data/models/upload_data_model.dart';

import '../../../../core/network/dio_helper.dart';

abstract class UploadDataSource {
  Future<UploadReqModel>? upload(File? img);
}

class UploadDataSourceImpl implements UploadDataSource {
  @override
  Future<UploadReqModel>? upload(File? img) async {
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromFile(img!.path,
          filename: img.path.split('/').last),
    });
    Response value = await DioHelper.postData(
        uri: Endpoints.uploadEndpoint,
        data: formData,
        header: {"Authorization": 'Bearer ${CacheHelper.getData('token')}'});
    return UploadReqModel.fromJson(value.data);
  }
}
