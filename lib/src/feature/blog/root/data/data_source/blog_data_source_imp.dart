import 'package:dio/dio.dart';
import 'package:fake_commerce/src/feature/blog/root/data/data_source/blog_data_source.dart';
import 'package:logger/logger.dart';

class BlogDataSourceImp implements BlogDataSource {
  BlogDataSourceImp({
    required this.client,
  });
  final Dio client;

  final Logger _logger = Logger();
  @override
  Future<Response> blogsList() async {
    Response response = await client.get('https://api.biddabari.com/api/posts');
    _logger.d(response.data);
    return response;
  }

  @override
  Future<Response> blogCategories() async {
    Response response =
        await client.get('https://api.biddabari.com/api/post-category');
    _logger.d(response.data);
    return response;
  }

  @override
  Future<Response> categoriesWiseBlogs(String slug) async {
    Response response = await client
        .get('https://api.biddabari.com/api/post-by-category/$slug');
    print('https://api.biddabari.com/api/post-by-category/$slug');
    _logger.d(response.data);
    return response;
  }
}
