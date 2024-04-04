import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:gallery/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:gallery/features/auth/data/repositories/login_repo_impl.dart';
import 'package:gallery/core/network/network_info.dart';
import 'package:gallery/features/auth/data/datasources/login_data_source.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthCubit(
                  loginRepo: LoginRepoImpl(
                      networkInfo: NetworkInfoImpl(
                          internetConnectionChecker:
                              InternetConnectionChecker()),
                      loginDataSource: LoginDataSourceImpl()),
                )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gallery',
        theme: appTheme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
