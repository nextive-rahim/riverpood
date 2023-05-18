import 'package:dio/dio.dart';
import 'package:fake_commerce/src/core/network/rest_client.dart';
import 'package:fake_commerce/src/feature/blog/root/data/blog_data_source_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogDataSourceProvider = Provider<BlogDataSource>(
  ((ref) {
    return BlogDataSourceImp(
      client: ref.read(dioProvider),
    );
  }),
);

abstract class BlogDataSource {
  Future<Response> blogsList();
  Future<Response> blogCategories();
  Future<Response> categoriesWiseBlogs(String slug);
}
