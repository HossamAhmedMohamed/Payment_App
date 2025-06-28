import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/widgets/custom_check_icon.dart';
import 'package:payment_app/features/checkout/presentation/widgets/custom_dashed_line.dart';
import 'package:payment_app/features/checkout/presentation/widgets/thank_you_card.dart';

class ThankYouScreenBody extends StatelessWidget {
  const ThankYouScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),

          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),

          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),

          Positioned(top: -50, left: 0, right: 0, child: CustomCheckIcon()),

          Positioned(
            left: 20 + 8,
            right: 20 + 8,
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            child: CustomDashedLine(),
          ),
        ],
      ),
    );
  }
}
