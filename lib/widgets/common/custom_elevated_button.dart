import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.width,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF003366).withOpacity(0.8),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon!= null)
                Icon(
                  icon,
                  color: Colors.white,
                ),
              if (icon!= null) SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}