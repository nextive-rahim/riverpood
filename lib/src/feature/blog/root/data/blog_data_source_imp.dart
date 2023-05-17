import 'package:dio/dio.dart';
import 'package:fake_commerce/src/feature/blog/root/data/blog_data_source.dart';
import 'package:logger/logger.dart';

class BlogDataSourceImp implements BlogDataSource {
  BlogDataSourceImp({
    required this.client,
  });
  final Dio client;

  final Logger _logger = Logger();
  @override
  Future<Response> blog() async {
    Response response = await client.get('https://api.biddabari.com/api/posts');
    _logger.d(response.data);
    return response;
  }
}
