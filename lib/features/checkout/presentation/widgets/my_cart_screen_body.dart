import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/data/repository/check_out_repo_impl.dart';
import 'package:payment_app/features/checkout/presentation/cubit/stripe_cubit/stripe_cubit.dart';
import 'package:payment_app/features/checkout/presentation/cubit/toggle_payment_cubit/payment_method_cubit.dart';
import 'package:payment_app/features/checkout/presentation/widgets/order_item_price.dart';
import 'package:payment_app/features/checkout/presentation/widgets/payment_method_modal_bottom_sheet.dart';
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

          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                clipBehavior: Clip.antiAlias,
                context: context,
                builder: (context) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => StripeCubit(CheckOutRepoImpl()),
                      ),
                      BlocProvider(create: (context) => PaymentMethodCubit()),
                    ],
                    child: PaymentMethodBottomSheet(),
                  );
                },
              );
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
