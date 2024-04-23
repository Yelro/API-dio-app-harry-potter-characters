import 'package:dio_app/helpers/base_http_dio.dart';
import 'package:dio_app/helpers/http_response.dart';
import 'package:dio_app/models/potters_response.dart';

class PotterAPI {
  final BaseHttpDio baseHttpDio;

  PotterAPI(this.baseHttpDio);

  Future<HttpResponse<PottersResponse>> getAllPotters() async {
    return baseHttpDio.resquest('/api/characters', method: 'GET', parser: (data) {
      return PottersResponse.fromJson(data);
    });
  }

}
