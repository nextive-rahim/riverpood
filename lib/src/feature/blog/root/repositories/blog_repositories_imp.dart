import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fake_commerce/src/feature/blog/root/data/blog_data_source.dart';
import 'package:fake_commerce/src/feature/blog/root/domain/repositories/blog_repository.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_model.dart';

class BlogRepositoriesImp implements BlogRepository {
  BlogRepositoriesImp({required this.blogDataSource});
  final BlogDataSource blogDataSource;
  @override
  Future<Either<Exception, List<BlogModel>>> blog() async {
    try {
      Response response = await blogDataSource.blog();

      BlogResponseModel blogResponseModel =
          BlogResponseModel.fromJson(response.data);

      List<BlogModel> blogs = blogResponseModel.data!;
      return Right(blogs);
    } catch (e, stackTrace) {
      log(
        'BlogRepositoryImpl.blogList',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Exception(e));
    }
  }
}
