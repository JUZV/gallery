import 'package:gallery/features/app/domain/entities/gallery_data.dart';

abstract class GalleryRepo {
  Future<GalleryReq?> getGallery();
}
