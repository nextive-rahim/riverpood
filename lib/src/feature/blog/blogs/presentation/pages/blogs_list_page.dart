import 'package:fake_commerce/src/feature/blog/blogs/presentation/riverpod/provider.dart';
import 'package:fake_commerce/src/feature/blog/blogs/presentation/widget/blogs_loading_shimmer.dart';
import 'package:fake_commerce/src/feature/blog/blogs_categories/presentation/riverpod/provier.dart';
import 'package:fake_commerce/src/feature/blog/blogs_categories/presentation/widget/blogs_categories_loading_shimmer.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_model.dart';
import 'package:fake_commerce/src/feature/widget/common_dropdown_button.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(blogProvider);
    final blogCategories = ref.watch(blogsCategoriesProvier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blogs',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body:
          // state is LoadingState
          //     ? const ProductsLoadingShimmer()
          //     : state is SuccessState<List<BlogModel>>
          //         ? _BlogsListBuilder(blogs: state.data!)
          //         : const Center(child: Text('Error')),

          Column(
        children: [
          Container(
            child: blogCategories.when(
              data: ((data) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: CommonDropdownButton(
                    onChanged: (value) {
                      ref.read(dropdownValueProvider.notifier).state = value!;
                    },
                    items: data.map((e) => e.name).toList(),
                  ),
                );
              }),
              error: ((error, stackTrace) {
                return Text(error.toString());
              }),
              loading: (() {
                return const BlogCategoriesLoadingShimmer();
              }),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                return await ref.refresh(blogProvider);
              },
              child: Container(
                child: state.when(
                  data: ((data) {
                    return SingleChildScrollView(
                      child: _BlogsListBuilder(blogs: data),
                    );
                  }),
                  error: ((error, stackTrace) {
                    return Text(
                      error.toString(),
                    );
                  }),
                  loading: (() {
                    return const BlogLoadingShimmer();
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
