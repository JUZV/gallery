import 'dart:io';

import 'package:gallery/core/network/network_info.dart';
import 'package:gallery/core/util/constants.dart';
import 'package:gallery/features/app/data/datasources/upload_data_source.dart';
import 'package:gallery/features/app/data/models/upload_data_model.dart';
import 'package:gallery/features/app/domain/repositories/upload_repo.dart';
import 'package:gallery/features/app/domain/entities/upload_data.dart';

class UploadRepoImpl implements UploadRepo {
  final NetworkInfo networkInfo;
  final UploadDataSource uploadDataSource;
  UploadRepoImpl({
    required this.networkInfo,
    required this.uploadDataSource,
  });
  @override
  Future<UploadReq?> upload(File? img) async {
    if (await networkInfo.isConnected) {
      final uploadReq = await uploadDataSource.upload(img);
      return uploadReq;
    } else {
      Constants.showToast(msg: 'please check your connection');
    }
  }
}
