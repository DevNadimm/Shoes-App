import 'package:flutter/material.dart';

class PaymentMethodRow extends StatelessWidget {
  final String imagePath;
  final String methodName;

  PaymentMethodRow({required this.imagePath, required this.methodName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 27,
          child: Image.asset(
            imagePath,
            scale: 20,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          methodName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Color(0xFF003366),
          ),
        ),
      ],
    );
  }
}
