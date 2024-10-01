import 'package:coffeeapp/components/coffee_tile.dart';
import 'package:coffeeapp/models/coffee.dart';
import 'package:coffeeapp/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});
// remove item from cart 

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void Removefromcart(Coffee coffee){
  Provider.of<CoffeeShop>(context,listen:false).RemoveCoffee(coffee);
} 
// pay method 
void payNow(){

}
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context,value,child)=>SafeArea(child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(children: [
      
        Text(' your Cart',style: TextStyle(fontSize: 20),)
       ,SizedBox(height: 60,),
       Expanded(child: ListView.builder(
        itemCount :value.userCart.length,
        itemBuilder: (context,index){
      
      Coffee eachcoffee =value.userCart[index]; 

       return CoffeeTile(
        coffee: eachcoffee, 
       onPressed: ()=> Removefromcart(eachcoffee), 
       icon: Icon(Icons.delete));
        
   } ),
       
       
       ),
        GestureDetector(
          onTap: payNow,
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
  child: Center(child: Text("PAY NOW",style: TextStyle(color:Colors.white),)),
  decoration: BoxDecoration(borderRadius:BorderRadius.circular(18),color: Color.fromARGB(252, 194, 162, 87)),
),
        )

      ],

      
      
       ),
    )));
  }
}