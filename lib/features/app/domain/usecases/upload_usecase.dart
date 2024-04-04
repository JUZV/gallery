import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:gallery/core/usecases/usecase.dart';
import 'package:gallery/features/app/domain/entities/upload_data.dart';
import 'package:gallery/features/app/domain/repositories/upload_repo.dart';

class UploadUseCase implements UseCase<UploadReq, UploadParams> {
  final UploadRepo uploadRepo;

  UploadUseCase({required this.uploadRepo});
  @override
  Future<UploadReq?> call(UploadParams params) {
    return uploadRepo.upload(params.img);
  }
}

class UploadParams extends Equatable {
  final File? img;
  UploadParams({required this.img});

  @override
  List<Object?> get props => [
        img,
      ];
}
