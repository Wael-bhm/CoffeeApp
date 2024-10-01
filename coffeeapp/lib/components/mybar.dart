import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Mybar extends StatelessWidget {
  void Function(int)? onTabChange;
   Mybar({super.key,required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: GNav(
        onTabChange:(value)=> onTabChange!(value) ,
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 23 ,
        tabActiveBorder: Border.all(color:Colors.white),
        tabs: const [ 
         GButton(icon: Icons.shopping_bag,text: 'Shop',),
         GButton(icon: Icons.shopping_basket,text: 'Cart',),
         GButton(icon:Icons.notifications, text: 'Notifications',)
      ]),
    );
  }
}