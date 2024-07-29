import 'package:flutter/material.dart';

class ShippingAddressRow extends StatelessWidget {
  const ShippingAddressRow({super.key, required this.value, required this.icon});

  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color(0xFF003366).withOpacity(0.8),
          size: 17,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF003366),
            ),
          ),
        ),
      ],
    );
  }
}
