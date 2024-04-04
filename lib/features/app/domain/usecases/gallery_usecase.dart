import 'package:gallery/core/usecases/usecase.dart';
import 'package:gallery/features/app/domain/entities/gallery_data.dart';
import 'package:gallery/features/app/domain/repositories/gallery_repo.dart';

class GalleryUseCase implements UseCase<GalleryReq, NoParams> {
  final GalleryRepo galleryRepo;

  GalleryUseCase({required this.galleryRepo});
  @override
  Future<GalleryReq?> call(NoParams params) {
    return galleryRepo.getGallery();
  }
}
