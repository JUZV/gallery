import 'dart:io';

import 'package:gallery/features/app/domain/entities/upload_data.dart';

abstract class UploadRepo {
  Future<UploadReq?> upload(File? img);
}
