import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts() async {
    const String url = "https://fakestoreapi.com/products";
    final response = await _dio.get(url);
    return response.data;
  }
}
