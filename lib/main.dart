import 'package:flutter/material.dart';
import 'package:gallery/app.dart';
import 'package:gallery/core/network/dio_helper.dart';
import 'package:gallery/core/util/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}
