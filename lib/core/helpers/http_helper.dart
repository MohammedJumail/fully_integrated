import 'package:dio/dio.dart';

class HttpHelper<T> {
  HttpHelper._();

  static HttpHelper? _instance;
  static HttpHelper get instance {
    if (_instance == null) _instance = HttpHelper._();
    return _instance!;
  }

  Dio _d = Dio();

  Future<Response> get(String url) async {
    return await _d.get(url);
  }

  post() {}
  push() {}
  delete() {}

  T convertResponseToObject(dynamic data) {
    throw ();
  }
}

