import 'dart:developer';

import 'package:fake_commerce/src/feature/blog/blogs/domin/use_cases/blog_use_case.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final blogProvider =
//     StateNotifierProvider<BlogsNotifier, BaseState>(
//   ((ref) {
//     return BlogsNotifier(
//       ref: ref,
//       useCases: ref.watch(blogsUseCaseProvider),
//     );
//   }),
// );

final blogDataProvider = Provider<BlogModel>(
  (ref) => throw UnimplementedError(),
);
final blogCategoriesDataProvider = Provider<Category>(
  (ref) => throw UnimplementedError(),
);

final blogProvider = FutureProvider.autoDispose<List<BlogModel>>(
  (ref) async {
    final categories = await ref.watch(blogsUseCaseProvider).blogs();

    return categories.fold(
      (l) {
        log(
          'categoriesProvider',
          error: l,
        );
        return [];
      },
      (r) {
        ref.keepAlive();
        return r;
      },
    );
  },
);
