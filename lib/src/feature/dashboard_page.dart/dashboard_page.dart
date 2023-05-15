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
        child: ElevatedButton(
          onPressed: () {
            _navigateToProductDetailsPage(context);
          },
          child: const Text('Go To Products Page'),
        ),
      ),
    );
  }

  void _navigateToProductDetailsPage(
    BuildContext context,
  ) {
    context.goNamed(
      Routes.productList.name,
      queryParameters: <String, String>{},
    );
  }
}
