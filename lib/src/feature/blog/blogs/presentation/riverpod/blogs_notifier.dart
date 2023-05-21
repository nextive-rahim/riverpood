import 'dart:developer';

import 'package:fake_commerce/src/core/state/base_state.dart';
import 'package:fake_commerce/src/feature/blog/blogs/domin/use_cases/blog_use_case.dart';
import 'package:fake_commerce/src/feature/blog/categories_wise_blogs.dart/domain/use_case/categories_wise_blogs_use_case.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogsNotifier extends StateNotifier<BaseState> {
  BlogsNotifier({
    required this.ref,
    required this.useCases,
    required this.categoriesWiseBlogsUseCase,
  }) : super(InitialState()) {
    bloglist(null, null);
  }
  final Ref ref;
  final BlogdUseCases useCases;
  final CategoriesWiseBlogsUseCase categoriesWiseBlogsUseCase;
  List<BlogModel> blogList = [];
  Future<void> bloglist(
    String? selectedCategory,
    String? slug,
  ) async {
    if (selectedCategory != null) {
      if (state is SuccessState) {
        try {
          final result =
              await categoriesWiseBlogsUseCase.categoriesWiseBlogs(slug!);
          result.fold((l) {
            log(
              'BlogNotifier.blogList',
              error: l,
            );

            return state = ErrorState(data: l.toString());
          }, (r) {
            return state = SuccessState(data: r);
          });
        } catch (e, stackTrace) {
          log(
            'BlogNotifier.blogList',
            error: e,
            stackTrace: stackTrace,
          );
          state = ErrorState(
            data: e.toString(),
          );
        }
        return;
      }
    }
    state = const LoadingState();
    try {
      final result = await useCases.blogs();
      result.fold((l) {
        log(
          'BlogNotifier.blogList',
          error: l,
        );

        return state = ErrorState(data: l.toString());
      }, (r) {
        blogList = r;
        return state = SuccessState(data: r);
      });
    } catch (e, stackTrace) {
      log(
        'BlogNotifier.blogList',
        error: e,
        stackTrace: stackTrace,
      );
      state = ErrorState(
        data: e.toString(),
      );
    }
  }
}
