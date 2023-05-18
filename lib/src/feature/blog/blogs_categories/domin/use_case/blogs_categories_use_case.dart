import 'package:dartz/dartz.dart';
import 'package:fake_commerce/src/feature/blog/root/domain/repositories/blog_repository.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_categories_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogCategoriesUseCase = Provider<BlogsCategoriesUseCase>(
  ((ref) {
    return BlogsCategoriesUseCase(
      ref.watch(blogProviderRepository),
    );
  }),
);

class BlogsCategoriesUseCase {
  BlogsCategoriesUseCase(this._repository);
  final BlogRepository _repository;
  Future<Either<Exception, List<BlogCategoriesModel>>> blogCategories() async {
    return await _repository.blogCategories();
  }
}
