import 'package:fake_commerce/src/core/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashBoardPage extends ConsumerWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateToProductsPage(context);
              },
              child: const Text('Go To Products Page'),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToBlogsPage(context);
              },
              child: const Text('Go To Blogs Page'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProductsPage(
    BuildContext context,
  ) {
    context.goNamed(
      Routes.productList.name,
    );
  }

  void _navigateToBlogsPage(
    BuildContext context,
  ) {
    context.goNamed(
      Routes.blogsList.name,
    );
  }
}
