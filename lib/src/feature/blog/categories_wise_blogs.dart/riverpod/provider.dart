import 'dart:developer';
import 'package:fake_commerce/src/feature/blog/categories_wise_blogs.dart/domain/use_case/categories_wise_blogs_use_case.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesWiseBlogsProvider =
    FutureProvider.autoDispose.family<List<BlogModel>, String>(
  ((ref, value) async {
    final categoriesWiseBlogs =
        await ref.read(categoriesWiseBlogsUseCase).categoriesWiseBlogs(value);
    try {
      return categoriesWiseBlogs.fold(
        (l) => [],
        (r) {
          //  ref.keepAlive();
          print(r.length);
          return r;
        },
      );
    } catch (e, strackTrace) {
      log(
        'categoriesWiseBlogsProvider.futureProvider',
        error: e,
        stackTrace: strackTrace,
      );
    }

    return [];
  }),
);

