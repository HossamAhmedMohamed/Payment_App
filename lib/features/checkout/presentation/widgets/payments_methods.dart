import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentsMethod extends StatelessWidget {
  const PaymentsMethod({super.key, required this.isActive , required this.image});

  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 62,
       width: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15,),
        border: Border.all(
          color: isActive ? Color(0xFF34A853) : Colors.grey,
          width: 1.5,
        ),
        boxShadow:
            !isActive
                ? null
                : [
                  BoxShadow(
                    color: isActive ? Color(0xFF34A853) : Colors.white,
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                  ),
                ],
      ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(child: SvgPicture.asset(image)),
      ),
    );
  }
}
