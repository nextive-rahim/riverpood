import 'dart:developer';

import 'package:fake_commerce/src/feature/blog/blogs_categories/domin/use_case/blogs_categories_use_case.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_categories_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final blogCategoriesDataProvider = Provider<BlogCategoriesModel>(
  (ref) => throw UnimplementedError(),
);
final blogsCategoriesProvier = FutureProvider<List<BlogCategoriesModel>>(
  ((ref) async {
    final blogCategories =
        await ref.watch(blogCategoriesUseCase).blogCategories();
    return blogCategories.fold(
      (l) {
        log(
          'blogsCategoriesProvier',
          error: l,
        );
        return [];
      },
      (r) {
        return r;
      },
    );
  }),
);
