import 'package:equatable/equatable.dart';

class UploadReq extends Equatable {
  final String? status;
  final String? message;

  UploadReq({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
