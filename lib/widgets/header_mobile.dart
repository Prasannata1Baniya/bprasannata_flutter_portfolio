import'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/widgets/pb.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key,  this.onLogoTab,  this.menuTab});
  final VoidCallback? onLogoTab;
  final VoidCallback? menuTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
      height: 50,
      width:double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.transparent,
              CustomColor.bglight1,
            ]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LogoPage(onTap: onLogoTab,),
          const Spacer(),
          IconButton(onPressed: menuTab, icon:const Icon(Icons.menu)),
        ],
      ),
    );
  }
}
