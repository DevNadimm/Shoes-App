import 'package:flutter/material.dart';

class DiscountField extends StatefulWidget {
  final TextEditingController controller;
  final Function(double) applyDiscount;
  final double subTotal;

  DiscountField(
      {required this.controller,
      required this.applyDiscount,
      required this.subTotal});

  @override
  State<DiscountField> createState() => _DiscountFieldState();
}

class _DiscountFieldState extends State<DiscountField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 7),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color(0xFF003366).withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: "Have a promo code? Enter here",
                hintStyle: TextStyle(
                  color: const Color(0xFF003366).withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: const Color(0xFF003366),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (widget.controller.text == 'Nadim20') {
                  widget.applyDiscount(widget.subTotal * 0.2);
                } else {
                  widget.applyDiscount(0.0);
                }
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0XFF325B84),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
