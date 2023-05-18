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

final blogProvider = FutureProvider.autoDispose<List<BlogModel>>(
  (ref) async {
    final blogs = await ref.read(blogsUseCaseProvider).blogs();

    return blogs.fold(
      (l) {
        log(
          'BlogdProvider',
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
