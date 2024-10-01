import 'package:coffeeapp/components/mybar.dart';
import 'package:coffeeapp/constants.dart';
import 'package:coffeeapp/models/news_box.dart';
import 'package:coffeeapp/pages/cart_page.dart';
import 'package:coffeeapp/pages/homepage.dart';
import 'package:coffeeapp/pages/notifications.dart';
import 'package:coffeeapp/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class acceuil extends StatefulWidget {
  const acceuil({super.key});

  @override
  State<acceuil> createState() => _acceuilState();
}

class _acceuilState extends State<acceuil> {
  @override

   int selectedIndex =0; 
   void navigateBottomBar(int index){
    setState(() {
      selectedIndex=index;
    });
   }
  final List<Widget> _pages=[
    ShopPage(),
   CartPage(),
Consumer<NewsBox>( // Utilisation de Consumer pour accéder à NewsBox
        builder: (context, newsBox, _) => Notifications(), // Appeler directement Notifications
      ), ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      /* l9owa lkol fl fonction onTabChange
       hya ili to7kom fl index elle supervise
      lindex enty tet3da ll icone ili ba3dha fl 
      nav bar w hya trod index 1 donc ta5tar index num 1 fl
      List pages
*/
      bottomNavigationBar: Mybar(onTabChange: (index ) =>navigateBottomBar(index),),
      body: _pages[selectedIndex],
    );
  }
}