import 'package:gallery/features/app/domain/entities/gallery_data.dart';
import 'package:gallery/features/app/presentation/pages/gallery.dart';

class GalleryReqModel extends GalleryReq {
  GalleryReqModel({
    required String status,
    required GalleryDataModel data,
    required String message,
  }) : super(
          status: status,
          data: data,
          message: message,
        );
  factory GalleryReqModel.fromJson(Map<String, dynamic>? json) {
    return GalleryReqModel(
        status: json?['status'],
        data: GalleryDataModel.fromJson(json?['data']),
        message: json?['message']);
  }
}

class GalleryDataModel {
  List<String> images = [];

  GalleryDataModel.fromJson(Map<String, dynamic>? json) {
    json?['images'].forEach((e) {
      images.add(e);
    });
  }
}
