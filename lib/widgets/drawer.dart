import'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/constant/nav_title.dart';

class DrawerPage extends StatelessWidget {
  final void Function(int index) onNavTap;
  const DrawerPage({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    //Drawer for mobile Screen
    return  Drawer(
      backgroundColor: CustomColor.scaffold,
      child:ListView(
        children: [
          Align(
            alignment:Alignment.centerLeft,
            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  //scaffoldKey.currentState?.closeEndDrawer();
                },
                icon:const Icon(Icons.close,color: Colors.white,size:30)),
          ),
          for(int i=0;i<iconsData.length;i++)
            ListTile(
              contentPadding:const EdgeInsets.symmetric(horizontal: 15),
              leading: Icon(iconsData[i]),
              title:Text(navigationTitle[i]),
              onTap: ()=>onNavTap(i),
            ),
        ],
      ),
    );
  }
}
