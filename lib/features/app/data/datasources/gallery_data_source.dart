import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/core/api/endpoints.dart';
import 'package:gallery/core/util/cache_helper.dart';
import 'package:gallery/features/app/data/models/gallery_data_model.dart';

import '../../../../core/network/dio_helper.dart';

abstract class GalleryDataSource {
  Future<GalleryReqModel>? getGallery();
}

class GalleryDataSourceImpl implements GalleryDataSource {
  @override
  Future<GalleryReqModel>? getGallery() async {
    Response value = await DioHelper.getData(
        uri: Endpoints.galleryEndpoint,
        header: {"Authorization": 'Bearer ${CacheHelper.getData('token')}'});
    return GalleryReqModel.fromJson(value.data);
  }
}
