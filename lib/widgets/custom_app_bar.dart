import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});

  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: const BorderRadius.horizontal(
      left: Radius.circular(30),
    ),
    borderSide: BorderSide(
      width: 1.8,
      color: const Color(0xFF003366).withOpacity(0.5),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            'Shoes \nCollection',
            style: TextStyle(
              color: Color(0xFF003366),
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1.2,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF003366).withOpacity(0.7),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: const Color(0xFF003366).withOpacity(0.7),
                ),
                border: border,
                focusedBorder: border,
                enabledBorder: border,
            ),
          ),
        ),
      ],
    );
  }
}
