import 'package:fake_commerce/src/core/state/base_state.dart';
import 'package:fake_commerce/src/feature/blog/presentation/riverpod/provider.dart';
import 'package:fake_commerce/src/feature/blog/root/model/blog_model.dart';
import 'package:fake_commerce/src/feature/product/products/presentation/widget/products_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part '../widget/blog_card.dart';
part '../widget/blogs_list_builder.dart';

class BlogsListPage extends ConsumerStatefulWidget {
  const BlogsListPage({super.key});

  @override
  ConsumerState<BlogsListPage> createState() => _BlogsListPageState();
}

class _BlogsListPageState extends ConsumerState<BlogsListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(blogProvider.notifier).bloglist();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(blogProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: state is LoadingState
          ? const ProductsLoadingShimmer()
          : state is SuccessState<List<BlogModel>>
              ? _BlogsListBuilder(blogs: state.data!)
              : const Center(child: Text('Error')),

      // Container(
      //   child: state.when(
      //     data: ((data) {
      //       return _BlogsListBuilder(blogs: data.);
      //     }),
      //     error: ((error, stackTrace) {
      //       return const Text('data');
      //     }),
      //     loading: (() {
      //       return const BlogLoadingShimmer();
      //     }),
      //   ),
      // ),
    );
  }
}
