import 'package:coffeeapp/models/coffee.dart';
import 'package:flutter/material.dart';
class CoffeeShop extends ChangeNotifier{
  // coffe for sale list 
  final List<Coffee>shop=[
    Coffee(name:'IcedCoffe',price:'5.0',imagepath: 'bubble-tea.png'),
      Coffee(name:'esspresso',price:'2.0',imagepath: 'images/expresso.png'),

    Coffee(name:'black coffee',price:'2.50',imagepath: 'images/coffee.png'),

    Coffee(name:'Cappucino',price:'2.50',imagepath: 'images/cup_16224040.png')

  ];
  // usercart
   List<Coffee> _userCart=[]; 
  // get coffelist
  List <Coffee> get coffeshop=>shop;
  // get user cart 
  // ignore: recursive_getters
  List<Coffee> get userCart => _userCart;
  // add item to cart
  void addItemtoCart(Coffee x,int n){
    for (var v = 0; v<n; v++) {
  _userCart.add(x);
}
     print('${x.name} added to cart');
    notifyListeners();

  }

  // remove item from cart
  void RemoveCoffee(Coffee coffee){
         _userCart.remove(coffee);
         notifyListeners();
  }
}