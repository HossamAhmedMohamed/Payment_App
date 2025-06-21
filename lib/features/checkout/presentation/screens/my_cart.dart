import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';
import 'package:payment_app/features/checkout/presentation/widgets/my_cart_screen_body.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        title: Text(
          "My Cart",
          style: Styles.style25

        ),
        centerTitle: true,
       ),

       body: MyCartScreenBody(),
    );
  }
}