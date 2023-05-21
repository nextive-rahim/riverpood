import 'package:dartz/dartz.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_model.dart';
import 'package:fake_commerce/src/feature/blog/root/domain/repositories/blog_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesWiseBlogsUseCase = Provider<CategoriesWiseBlogsUseCase>(
  ((ref) {
    return CategoriesWiseBlogsUseCase(
      ref.watch(blogProviderRepository),
    );
  }),
);

class CategoriesWiseBlogsUseCase {
  CategoriesWiseBlogsUseCase(this._repository);
  final BlogRepository _repository;
  Future<Either<Exception, List<BlogModel>>> categoriesWiseBlogs(
      String slug) async {
    return _repository.categoriesWiseBlogs(slug);
  }
}
