import 'package:flutter/cupertino.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/filters.dart';
import '../widgets/product_container.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          const Filters(),
          const ProductContainer(),
        ],
      ),
    );
  }
}
