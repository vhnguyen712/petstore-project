import 'package:dio/dio.dart';
import 'package:petstore_application/data/models/product_model.dart';
import 'package:petstore_application/data/services/product_service.dart';

class ProductRepository {
  final ProductService service;

  ProductRepository({required this.service});
  Future<List<ProductModel>?> fetchAllProducts() async {
    try {
      final productRaw = await service.fetchAllProducts();
      return productRaw!.map((e) => ProductModel.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
