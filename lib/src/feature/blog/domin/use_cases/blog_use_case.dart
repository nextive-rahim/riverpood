import 'package:dartz/dartz.dart';
import 'package:fake_commerce/src/feature/blog/root/domain/repositories/blog_repository.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogsUseCaseProvider = Provider(
  ((ref) {
    return BlogdUseCases(
      ref.watch(blogProviderRepository),
    );
  }),
);

class BlogdUseCases {
  BlogdUseCases(this._repository);
  final BlogRepository _repository;
  Future<Either<Exception, List<BlogModel>>> blogs() async {
    return await _repository.blog();
  }
}
