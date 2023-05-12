import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  CategoryDataSourceImpl({
    required this.client,
  });

  final Dio client;
  Logger logger = Logger();
  @override
  Future<Response> categories() async {
    final response = await client.get(
      'https://fakestoreapi.com/products/categories',
    );
    logger.d(response.data);
    return response;
  }
}
