import 'package:equatable/equatable.dart';
import 'package:gallery/core/usecases/usecase.dart';
import 'package:gallery/features/auth/domain/entities/login_data.dart';
import 'package:gallery/features/auth/domain/repositories/login_repo.dart';

class LoginUseCase implements UseCase<LoginData, LoginParams> {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});
  @override
  Future<LoginData?> call(LoginParams params) {
    return loginRepo.login(params.userId, params.password);
  }
}

class LoginParams extends Equatable {
  final String userId;
  final String password;
  LoginParams({required this.userId, required this.password});

  @override
  List<Object?> get props => [
        userId,
        password,
      ];
}
