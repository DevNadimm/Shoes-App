import 'package:flutter/material.dart';
import '../global_variables.dart';
import '../screens/product_details_screen.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      title: '${product['title']}',
                      imgUrl: '${product['imageUrl']}',
                      price: '${product['price']}',
                      sizes: List<int>.from(product['sizes']),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: index % 2 == 0
                      ? Color(0xFF003366).withOpacity(0.1)
                      : Color(0xFF301934).withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product['title']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF003366),
                        ),
                      ),
                      Text(
                        '\$${product['price']}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF003366),
                        ),
                      ),
                      Image.asset(
                        '${product['imageUrl']}',
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
