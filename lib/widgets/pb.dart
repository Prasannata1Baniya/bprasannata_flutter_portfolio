import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key,this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text("PB",
        style: TextStyle(
          color: CustomColor.whitePrimary,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),),
    );
  }
}
