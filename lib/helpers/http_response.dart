import 'package:dio_app/helpers/http_error.dart';
import 'package:dio_app/models/potter.dart';

class HttpResponse<T> {
  final T? data;
  final HttpError? error;

  HttpResponse(this.data, this.error);

  static HttpResponse<T> success<T>(T data) => HttpResponse(data, null);

  static HttpResponse<T> fail<T>(
          int statusCode, String message, dynamic data) =>
      HttpResponse(null, HttpError(statusCode, message, data));

  static fromStream(Stream<HttpResponse<Potter>> potterStream) {}
}
