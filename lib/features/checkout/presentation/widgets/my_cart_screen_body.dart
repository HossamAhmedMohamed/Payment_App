import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/widgets/order_item_price.dart';
import 'package:payment_app/features/checkout/presentation/widgets/total_price.dart';

class MyCartScreenBody extends StatelessWidget {
  const MyCartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('assets/images/basket_image.png')),

          const SizedBox(height: 20),

          OrderItemPrice(title: 'Order Subtotal', price: '\$42.79'),

          const SizedBox(height: 10),
          OrderItemPrice(title: 'Discount', price: '\$0.00'),

          const SizedBox(height: 10),
          OrderItemPrice(title: 'Shipping', price: '\$8.00'),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(thickness: 2, color: Color(0xFFC7C7C7)),
          ),

          SizedBox(height: 10),

          TotalPrice(title: "Total", price: '\$50.79'),
          const SizedBox(height: 20),

          CustomButton(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
