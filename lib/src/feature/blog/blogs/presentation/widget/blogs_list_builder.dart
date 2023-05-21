part of '../pages/blogs_list_page.dart';

class _BlogsListBuilder extends ConsumerWidget {
  const _BlogsListBuilder({
    Key? key,
    required this.blogs,
  }) : super(key: key);
  final List<BlogModel> blogs;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return ProviderScope(overrides: [
              blogDataProvider.overrideWithValue(
                blogs[index],
              ),
            ], child: const _BlogsCard());
          }),
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: blogs.length,
        ),
      ),
    );
  }
}
