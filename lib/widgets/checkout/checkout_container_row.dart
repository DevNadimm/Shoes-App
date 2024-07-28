import 'package:flutter/material.dart';

class CheckoutContainerRow extends StatelessWidget {
  const CheckoutContainerRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF003366),
            fontSize: 15,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF003366),
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
