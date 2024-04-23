import 'package:dio/dio.dart';
import 'package:dio_app/api/potter_api.dart';
import 'package:dio_app/helpers/base_http_dio.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjection {
  static void initialize() {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://hp-api.onrender.com/'),
    );

    BaseHttpDio baseHttpDio = BaseHttpDio(dio);

    final PotterAPI potterAPI = PotterAPI(baseHttpDio);
    GetIt.instance.registerSingleton<PotterAPI>(potterAPI);
  }
}
