import 'package:fake_commerce/src/feature/blog/blogs/presentation/riverpod/provider.dart';
import 'package:fake_commerce/src/feature/blog/blogs/presentation/widget/blogs_loading_shimmer.dart';
import 'package:fake_commerce/src/feature/blog/blogs_categories/presentation/riverpod/provier.dart';
import 'package:fake_commerce/src/feature/blog/blogs_categories/presentation/widget/blogs_categories_loading_shimmer.dart';
import 'package:fake_commerce/src/feature/blog/categories_wise_blogs.dart/riverpod/provider.dart';
import 'package:fake_commerce/src/feature/blog/root/data/model/blog_categories_model.dart';
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
    final blogs = ref.watch(blogProvider);
    final blogCategories = ref.watch(blogsCategoriesProvier);
    final categoriesWiseProvider =
        ref.watch(dropdownValueProvider.notifier).state != null
            ? ref.watch(categoriesWiseBlogsProvider(
                ref.watch(dropdownValueProvider.notifier).state!))
            : null;

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
                    onChanged: (value) async {
                      BlogCategoriesModel valuess =
                          data.firstWhere((element) => element.name == value);

                      ref.watch(dropdownValueProvider.notifier).state =
                          valuess.name;

                      ref.watch(categoriesWiseBlogsProvider(valuess.slug!));
                    },
                    items: data.map((e) => e.name!).toList(),
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
          ref.watch(dropdownValueProvider.notifier).state != null
              ? Expanded(
                  child: Container(
                    child: categoriesWiseProvider!.when(data: ((data) {
                      return SingleChildScrollView(
                        child: _BlogsListBuilder(blogs: data),
                      );
                    }), error: ((error, stackTrace) {
                      return Text(error.toString());
                    }), loading: (() {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
                  ),
                )
              : Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      return await ref.refresh(blogProvider);
                    },
                    child: Container(
                      child: blogs.when(
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
