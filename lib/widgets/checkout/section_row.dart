import 'package:flutter/material.dart';
import 'package:shop_app/widgets/checkout/style.dart';

class SectionRow extends StatelessWidget {
  final String title;
  final String action;
  final double actionOpacity;
  final VoidCallback onTap;

  SectionRow({
    required this.title,
    required this.action,
    required this.actionOpacity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: sectionTitleStyle,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: changeTextStyle.copyWith(
              color: Color(0xFF003366).withOpacity(actionOpacity),
            ),
          ),
        ),
      ],
    );
  }
}
