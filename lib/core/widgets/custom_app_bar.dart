import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(title ?? '', style: Styles.style25),
    centerTitle: true,
  );
}
