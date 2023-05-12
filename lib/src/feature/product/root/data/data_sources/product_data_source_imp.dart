import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'product_data_source.dart';

class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl({
    required this.client,
  });

  final Dio client;
  Logger logger = Logger();
  @override
  Future<Response> fetchProductList() async {
    Response response = await client.get(
      'https://fakestoreapi.com/products',
    );
    logger.d(response.data);
    return response;
  }

  @override
  Future<Response> fetchProduct(int id) async {
    Response response = await client.get(
      'https://fakestoreapi.com/products/$id',
    );
    logger.d(response.data);
    return response;
  }
}
