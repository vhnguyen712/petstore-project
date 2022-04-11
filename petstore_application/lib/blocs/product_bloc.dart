import 'dart:async';

import 'package:petstore_application/data/models/product_model.dart';
import 'package:petstore_application/data/repositories/product_repository.dart';
import 'package:petstore_application/data/services/product_service.dart';

enum ProductEvent { fetch }

class ProductBloc {
  final ProductRepository _repository =
      ProductRepository(service: ProductService());

  final _stateStreamController = StreamController<List<ProductModel>>();
  StreamSink<List<ProductModel>> get _productSink =>
      _stateStreamController.sink;
  Stream<List<ProductModel>> get productStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<ProductEvent>();
  StreamSink<ProductEvent> get eventSink => _eventStreamController.sink;
  Stream<ProductEvent> get _eventStream => _eventStreamController.stream;

  ProductBloc() {
    _eventStream.listen((event) async {
      if (event == ProductEvent.fetch) {
        try {
          var products = await _repository.fetchAllProducts();
          _productSink.add(products!);
        } on Exception {
          _productSink.addError('Something went wrong');
        }
      }
    });
  }

  void dispose() {
    this._stateStreamController.close();
    this._eventStreamController.close();
  }
}
