import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/config/routes/app_routes.dart';
import 'package:gallery/core/util/cache_helper.dart';
import 'package:gallery/core/util/navigator.dart';
import 'package:gallery/features/auth/domain/entities/login_data.dart';
import 'package:gallery/features/auth/domain/repositories/login_repo.dart';
import 'package:gallery/features/auth/domain/usecases/login_usecase.dart';
import 'package:gallery/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginRepo loginRepo;
  LoginData? loginData;

  AuthCubit({
    required this.loginRepo,
  }) : super(AuthInitState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  void login(String user, String password, BuildContext context) async {
    emit(LoginLoadingState());
    final LoginParams loginParams =
        LoginParams(userId: user, password: password);
    final useCase = LoginUseCase(loginRepo: loginRepo);
    loginData = await useCase(loginParams);
    if (loginData?.token != null) {
      CacheHelper.setData('token', loginData?.token);
      CacheHelper.setData('user', true);
      navigateTo(context, Routes.homeRoute);
      print(CacheHelper.getData('token'));
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  void logout(BuildContext context) async {
    if (state is! LogoutLoadingState) {
      emit(LogoutLoadingState());
      await CacheHelper.removeData('token');
      navigateAndKill(context, Routes.loginRoute);
      CacheHelper.setData('user', false);
      emit(LogoutSuccessState());
    }
  }
}
