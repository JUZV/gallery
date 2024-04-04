import 'package:gallery/core/network/network_info.dart';
import 'package:gallery/core/util/constants.dart';
import 'package:gallery/features/app/data/datasources/gallery_data_source.dart';
import 'package:gallery/features/app/data/datasources/upload_data_source.dart';
import 'package:gallery/features/app/domain/entities/gallery_data.dart';
import 'package:gallery/features/app/domain/repositories/gallery_repo.dart';

class GalleryRepoImpl implements GalleryRepo {
  final NetworkInfo networkInfo;
  final GalleryDataSource galleryDataSource;
  GalleryRepoImpl({
    required this.networkInfo,
    required this.galleryDataSource,
  });
  @override
  Future<GalleryReq?> getGallery() async {
    if (await networkInfo.isConnected) {
      final galleryReq = await galleryDataSource.getGallery();
      return galleryReq;
    } else {
      Constants.showToast(msg: 'please check your connection');
    }
  }
}
