import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final List<String> filterList = const [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Reebok',
    'Bata',
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filterList[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  },
                );
              },
              child: Chip(
                label: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: selectedFilter == filter
                    ? const Color(0xFF003366).withOpacity(0.8)
                    : const Color(0xFF003366).withOpacity(0.05),
              ),
            ),
          );
        },
      ),
    );
  }
}
