import 'package:flutter/material.dart';
import 'package:shop_app/widgets/common/global_variables.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import '../widgets/app_bar/product_list_screen_app_bar.dart';

class ShoesCollectionScreen extends StatefulWidget {
  const ShoesCollectionScreen({super.key});

  @override
  State<ShoesCollectionScreen> createState() => _ShoesCollectionScreenState();
}

class _ShoesCollectionScreenState extends State<ShoesCollectionScreen> {
  final List<String> filterList = const [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Reebok',
    'Bata',
  ];
  late List<Map<String, dynamic>> filteredProducts;
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filterList[0];
    filteredProducts = products;
  }

  void filterProducts(String filter) {
    if (filter == 'All') {
      filteredProducts = products;
    } else {
      filteredProducts =
          products.where((product) => product['company'] == filter).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProductListScreenAppBar(),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                final String filter = filterList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedFilter = filter;
                          filterProducts(filter);
                        },
                      );
                    },
                    child: Chip(
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: selectedFilter == filter
                                ? const Color(0XFFFFFFFF)
                                : const Color(0xFF003366),
                          ),
                        ),
                      ),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? const Color(0xFF003366).withOpacity(0.8)
                          : const Color(0xFF003366).withOpacity(0.05),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sentiment_dissatisfied,
                        color: Color(0xFF003366),
                        size: 40,
                      ),
                      Text(
                        'No products founds in this category!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF003366),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = filteredProducts[index];
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
                              borderRadius: BorderRadius.circular(15),
                              color: index % 2 == 0
                                  ? Color(0xFF003366).withOpacity(0.1)
                                  : Color(0xFF301934).withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${product['title']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF003366),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Color(0xFFFFFFFF)
                                              .withOpacity(0.8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 6),
                                          child: Text(
                                            '\$${product['price']}',
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF003366),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
          ),
        ],
      ),
    );
  }
}
