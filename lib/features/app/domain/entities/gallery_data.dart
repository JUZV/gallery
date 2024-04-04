import 'package:equatable/equatable.dart';
import 'package:gallery/features/app/data/models/gallery_data_model.dart';

class GalleryReq extends Equatable {
  final String? status;
  final GalleryDataModel? data;
  final String? message;

  GalleryReq({
    required this.status,
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [status, data, message];
}
