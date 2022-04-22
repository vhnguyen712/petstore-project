import 'dart:convert';

import 'package:dio/dio.dart';

class ProductService {
  final Dio _dio = Dio();
  final String _url = "http://192.168.1.8:8080/api/v1/products";

  Future<List<dynamic>?> fetchAllProducts() async {
    try {
      final response = await _dio.get(_url);
      return response.data;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
