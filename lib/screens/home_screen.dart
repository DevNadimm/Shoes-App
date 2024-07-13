import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/filters.dart';
import '../widgets/product_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            const Filters(),
            const ProductContainer(),
          ],
        ),
      ),
    );
  }
}
