import 'package:dartz/dartz.dart';
import 'package:fake_commerce/src/feature/blog/root/data/blog_data_source.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_categories_model.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_model.dart';
import 'package:fake_commerce/src/feature/blog/root/repositories/blog_repositories_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogProviderRepository = Provider(
  ((ref) {
    return BlogRepositoriesImp(
      blogDataSource: ref.watch(blogDataSourceProvider),
    );
  }),
);

abstract class BlogRepository {
  Future<Either<Exception, List<BlogCategoriesModel>>> blogCategories();
  Future<Either<Exception, List<BlogModel>>> blog();
}
