import 'dart:developer';

import 'package:fake_commerce/src/core/state/base_state.dart';
import 'package:fake_commerce/src/feature/blog/domin/use_cases/blog_use_case.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogsNotifier extends StateNotifier<BaseState> {
  BlogsNotifier({
    required this.ref,
    required this.useCases,
  }) : super(InitialState());
  final Ref ref;
  final BlogdUseCases useCases;
  List<BlogModel> blogList = [];
  Future<void> bloglist() async {
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
