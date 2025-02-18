import'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/constant/nav_title.dart';
import 'package:flutter_portfolio/widgets/pb.dart';

class HeaderDesktop extends StatelessWidget {
  final void Function(int index) onNavTap;
  const HeaderDesktop({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
      padding:const  EdgeInsets.only(left: 12.0,right: 12.0),
      height: 60,
      width:double.maxFinite,
      decoration: BoxDecoration(
        //color: Colors.deepOrange,
        gradient: LinearGradient(
            colors: [
              Colors.transparent,
              CustomColor.bglight1,
            ]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          LogoPage(onTap: (){}),
          const Spacer(),
          for(int i=0;i<navigationTitle.length;i++)
            Container(
              margin:const  EdgeInsets.only(right: 7),
              height: 50,
              decoration:BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () => onNavTap(i),
                child:Text(
                  key: Key('navigation_$i'),
                  navigationTitle[i],
                  style: TextStyle(color: CustomColor.textFieldBg,fontWeight: FontWeight.w700,
                      fontSize: 20),),
              ),
            ),
        ],
      ),
    );
  }
}
/*
 "Home",
  "Skills",
  "Project",
  "Blog",
  "Contact",
 */