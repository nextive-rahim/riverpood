import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fake_commerce/src/feature/blog/root/data/data_source/blog_data_source.dart';
import 'package:fake_commerce/src/feature/blog/root/domain/repositories/blog_repository.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_categories_model.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_model.dart';

class BlogRepositoriesImp implements BlogRepository {
  BlogRepositoriesImp({required this.blogDataSource});
  final BlogDataSource blogDataSource;
  @override
  Future<Either<Exception, List<BlogModel>>> blog() async {
    try {
      Response response = await blogDataSource.blogsList();

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

  /// Blog Categories
  @override
  Future<Either<Exception, List<BlogCategoriesModel>>> blogCategories() async {
    try {
      Response response = await blogDataSource.blogCategories();
      BlogCategoriesResponseModel blogCategoriesResponsed =
          BlogCategoriesResponseModel.fromJson(response.data);
      List<BlogCategoriesModel> blogcategoriesList =
          blogCategoriesResponsed.data!;
      return Right(blogcategoriesList);
    } catch (e, stackTrace) {
      log(
        'BlogRepositoryImpl.blogCategoris',
        error: e,
        stackTrace: stackTrace,
      );

      return Left(
        Exception(e),
      );
    }
  }
}
