import 'package:dio/dio.dart';

class JsonplaceholderCustonDio {
  final _dio = Dio();

  Dio get dio => _dio;
  JsonplaceholderCustonDio() {
    _dio.options.baseUrl = "https:jsonplaceholder.typicode.com/";
  }
}
