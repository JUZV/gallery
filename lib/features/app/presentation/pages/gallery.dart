import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/network/network_info.dart';
import 'package:gallery/core/util/hex_color.dart';
import 'package:gallery/core/util/media_query_values.dart';
import 'package:gallery/features/app/data/datasources/gallery_data_source.dart';
import 'package:gallery/features/app/data/datasources/upload_data_source.dart';
import 'package:gallery/features/app/data/repositories/gallery_repo_impl.dart';
import 'package:gallery/features/app/data/repositories/upload_repo_impl.dart';
import 'package:gallery/features/app/presentation/cubit/app_cubit.dart';
import 'package:gallery/features/app/presentation/cubit/app_state.dart';
import 'package:gallery/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:gallery/features/auth/presentation/cubit/auth_state.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AppCubit(
                  galleryRepo: GalleryRepoImpl(
                      networkInfo: NetworkInfoImpl(
                          internetConnectionChecker:
                              InternetConnectionChecker()),
                      galleryDataSource: GalleryDataSourceImpl()),
                  uploadRepo: UploadRepoImpl(
                      networkInfo: NetworkInfoImpl(
                          internetConnectionChecker:
                              InternetConnectionChecker()),
                      uploadDataSource: UploadDataSourceImpl()))
                ..getGallery())
        ],
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/gellary.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            children: [
                              BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  AuthCubit authCubit = AuthCubit.get(context);
                                  return Text(
                                    'Welcome\n${authCubit.loginData?.user!.name?.split(' ')[1]}',
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w300),
                                  );
                                },
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/images/user.png'),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BlocConsumer<AuthCubit, AuthState>(
                              listener:
                                  (BuildContext context, AuthState state) {},
                              builder: (BuildContext context, AuthState state) {
                                AuthCubit authCubit = AuthCubit.get(context);
                                return MaterialButton(
                                  onPressed: () {
                                    authCubit.logout(context);
                                  },
                                  minWidth: 120,
                                  height: 40,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  color: Colors.white,
                                  child: Row(children: [
                                    Image(
                                      image:
                                          AssetImage('assets/icons/logout.png'),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQueryValues(context).width * .04,
                                    ),
                                    Text(
                                      'log out',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ]),
                                );
                              },
                            ),
                            MaterialButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext cxt) {
                                    return Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.all(40),
                                        child: Material(
                                          color:
                                              Color.fromRGBO(255, 255, 255, .3),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 60, vertical: 40),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    cubit
                                                        .getImageFromGallery()
                                                        .then((value) {
                                                      cubit.upload();
                                                      cubit.getGallery();
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 50,
                                                    width: 145,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            HexColor('#EFD8F9'),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            "assets/icons/gallery.png"),
                                                        SizedBox(width: 8),
                                                        Text(
                                                          'Gallery',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#4A4A4A'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    cubit
                                                        .getImageFromCamera()
                                                        .then((value) {
                                                      cubit.upload();
                                                      cubit.getGallery();
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 50,
                                                    width: 145,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            HexColor('#EBF6FF'),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            "assets/icons/camera.png"),
                                                        Text(
                                                          'Camera',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#4A4A4A'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              minWidth: 120,
                              height: 40,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              color: Colors.white,
                              child: Row(children: [
                                Image(
                                  image: AssetImage('assets/icons/upload.png'),
                                ),
                                SizedBox(
                                  width: MediaQueryValues(context).width * .04,
                                ),
                                Text(
                                  'upload',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ]),
                            ),
                          ],
                        ),
                        cubit.galleryReq == null
                            ? Padding(
                                padding: const EdgeInsets.all(70),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 5,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 25),
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      cubit.galleryReq!.data!.images.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(cubit
                                                    .galleryReq!
                                                    .data!
                                                    .images[index]))),
                                      ),
                                    );
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
