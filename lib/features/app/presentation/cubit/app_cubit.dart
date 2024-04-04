import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/usecases/usecase.dart';
import 'package:gallery/core/util/constants.dart';
import 'package:gallery/features/app/domain/entities/gallery_data.dart';
import 'package:gallery/features/app/domain/repositories/gallery_repo.dart';
import 'package:gallery/features/app/domain/repositories/upload_repo.dart';
import 'package:gallery/features/app/domain/usecases/gallery_usecase.dart';
import 'package:gallery/features/app/domain/usecases/upload_usecase.dart';
import 'package:gallery/features/app/presentation/cubit/app_state.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppState> {
  final GalleryRepo galleryRepo;
  final UploadRepo uploadRepo;
  AppCubit({required this.galleryRepo, required this.uploadRepo})
      : super(AppInitState());

  File? image;
  final picker = ImagePicker();

  GalleryReq? galleryReq;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }

    emit(PickImageState());
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    return emit(PickImageState());
  }

  void upload() async {
    if (image != null) {
      emit(UploadLoadingState());
      final useCase = UploadUseCase(uploadRepo: uploadRepo);
      UploadParams params = UploadParams(img: image);
      final uploadReq = await useCase(params);
      if (uploadReq?.status == 'success') {
        emit(UploadSuccessState());
      } else {
        Constants.showToast(msg: "please check your connection");
        emit(UploadErrorState());
      }
    }
  }

  void getGallery() async {
    emit(GalleryLoadingState());
    final useCase = GalleryUseCase(galleryRepo: galleryRepo);
    galleryReq = await useCase(NoParams());
    if (galleryReq?.status == 'success') {
      emit(GallerySuccessState());
    } else {
      Constants.showToast(msg: "please check your connection");
      emit(GalleryErrorState());
    }
  }
}
