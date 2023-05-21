import 'package:fake_commerce/src/core/state/base_state.dart';
import 'package:fake_commerce/src/feature/blog/blogs/domin/use_cases/blog_use_case.dart';
import 'package:fake_commerce/src/feature/blog/blogs/presentation/riverpod/blogs_notifier.dart';
import 'package:fake_commerce/src/feature/blog/categories_wise_blogs.dart/domain/use_case/categories_wise_blogs_use_case.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_categories_model.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogProvider = StateNotifierProvider<BlogsNotifier, BaseState>(
  ((ref) {
    return BlogsNotifier(
      ref: ref,
      useCases: ref.watch(blogsUseCaseProvider),
      categoriesWiseBlogsUseCase: ref.watch(categoriesWiseBlogsUseCase),
    );
  }),
);

final blogDataProvider = Provider<BlogModel>(
  (ref) => throw UnimplementedError(),
);
// final blogCategoriesDataProvider = Provider<BlogCategoriesModel>(
//   (ref) => throw UnimplementedError(),
// );

// final blogProvider = FutureProvider<List<BlogModel>>(
//   (ref) async {
//     final blogs = await ref.read(blogsUseCaseProvider).blogs();

//     return blogs.fold(
//       (l) {
//         log(
//           'BlogdProvider',
//           error: l,
//         );
//         return [];
//       },
//       (r) {
//         //  ref.keepAlive();
//         return r;
//       },
//     );
//   },
// );
