import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/utils/styles.dart';

AppBar buildAppBar({ final String? title}) {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
    // leading: Center(
    //   child: SvgPicture.asset(AssetsImage.arrow),
    // ),
    backgroundColor: Colors.transparent,
  );
}
