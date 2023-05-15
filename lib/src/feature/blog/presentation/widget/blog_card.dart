part of '../pages/blogs_list_page.dart';

class _BlogsCard extends ConsumerWidget {
  const _BlogsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BlogModel data = ref.watch(blogDataProvider);
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.network(
                      data.photo!,
                      width: 100,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        return const SizedBox(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                            'https://us.123rf.com/450wm/mathier/mathier1905/mathier190500002/134557216-no-thumbnail-image-placeholder-for-forums-blogs-and-websites.jpg?ver=6');
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: Text(data.title ?? ''))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
