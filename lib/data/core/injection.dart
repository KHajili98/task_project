import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data_sources/path_data_source.dart';

final getIt = GetIt.instance;
final dio = Dio();

void setupLocator() {
  getIt.registerLazySingleton<PathDataSource>(() => PathDataSource());
}
