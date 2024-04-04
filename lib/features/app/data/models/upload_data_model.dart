import 'package:gallery/features/app/domain/entities/upload_data.dart';

class UploadReqModel extends UploadReq {
  UploadReqModel({
    required String status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );
  factory UploadReqModel.fromJson(Map<String, dynamic>? json) {
    return UploadReqModel(status: json?['status'], message: json?['message']);
  }
}
