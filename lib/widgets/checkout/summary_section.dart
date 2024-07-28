import 'package:flutter/material.dart';
import 'package:shop_app/widgets/checkout/checkout_container_row.dart';

const Color primaryColor = Color(0xFF003366);
const double padding = 16.0;
const double smallPadding = 8.0;
const double largePadding = 20.0;

const TextStyle sectionTitleStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 19,
  color: primaryColor,
);

const TextStyle changeTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 15,
  color: primaryColor,
);

class SummarySection extends StatelessWidget {
  final double subTotal;
  final double shippingCost;
  final double taxAmount;
  final double discount;
  final double orderTotal;

  SummarySection({
    required this.subTotal,
    required this.shippingCost,
    required this.taxAmount,
    required this.discount,
    required this.orderTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
      margin: const EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: primaryColor.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckoutContainerRow(
            label: 'Subtotal',
            value: '\$${subTotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 5),
          CheckoutContainerRow(
            label: 'Shipping',
            value: '\$${shippingCost.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 5),
          CheckoutContainerRow(
            label: 'Tax',
            value: '\$${taxAmount.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 5),
          CheckoutContainerRow(
            label: 'Discount',
            value: '-\$${discount.toStringAsFixed(2)}',
          ),
          const SizedBox(height: padding),
          Divider(color: primaryColor.withOpacity(0.3), thickness: 2),
          const SizedBox(height: padding),
          CheckoutContainerRow(
            label: 'Total',
            value: '\$${orderTotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: padding),
          Divider(color: primaryColor.withOpacity(0.3), thickness: 2),
          const SizedBox(height: padding),
          SectionRow(
            title: 'Payment Method',
            action: 'Change',
            actionOpacity: 0.8,
          ),
          const SizedBox(height: largePadding),
          PaymentMethodRow(),
          const SizedBox(height: largePadding),
          SectionRow(
            title: 'Shipping Address',
            action: 'Change',
            actionOpacity: 0.8,
          ),
          const SizedBox(height: smallPadding),
          ShippingAddress(),
        ],
      ),
    );
  }
}

class SectionRow extends StatelessWidget {
  final String title;
  final String action;
  final double actionOpacity;

  SectionRow({
    required this.title,
    required this.action,
    required this.actionOpacity,
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
          onTap: (){},
          child: Text(
            action,
            style: changeTextStyle.copyWith(
              color: primaryColor.withOpacity(actionOpacity),
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentMethodRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/gPay.png',
          scale: 20,
        ),
        const SizedBox(width: 8),
        Text(
          'Google Pay',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}

class ShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nadim Chowdhury',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColor,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.call,
              color: primaryColor.withOpacity(0.8),
              size: 17,
            ),
            const SizedBox(width: 15),
            Text(
              '+8801944557101',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: primaryColor.withOpacity(0.8),
              size: 17,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                'Green Haven Hills, Road No. 12, Green Valley, Chittagong, Bangladesh',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
