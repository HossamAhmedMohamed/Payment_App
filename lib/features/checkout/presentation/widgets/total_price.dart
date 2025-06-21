import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.price});

  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Styles.style24),
        const Spacer(),
        Text(price, style: Styles.style24),
      ],
    );
  }
}
