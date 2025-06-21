import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

AppBar buildAppBar({required final String title}) {
  return AppBar(
    toolbarHeight: 50,
    elevation: 0,
    title: Text(title, style: Styles.style25),
    centerTitle: true,
  );
}
