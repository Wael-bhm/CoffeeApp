import 'package:coffeeapp/models/coffee.dart';
import 'package:coffeeapp/models/coffee_shop.dart';
import 'package:coffeeapp/models/compteurcafe.dart';
import 'package:coffeeapp/pages/acceuil.dart';
import 'package:coffeeapp/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Nombrecafe extends StatefulWidget {
  final Coffee coffee;  // Ajout du paramètre pour recevoir l'objet Coffee

  const Nombrecafe({super.key, required this.coffee});
 
  
  @override
  State<Nombrecafe> createState() => _NombrecafeState();
}

class _NombrecafeState extends State<Nombrecafe> {
  

  


   void addToCart(Coffee coffee, int n) {
  print('Adding ${coffee.name} to cart $n times');

  // Ajouter le café au panier n fois
  Provider.of<CoffeeShop>(context, listen: false).addItemtoCart(coffee, n);

  // Affiche une boîte de dialogue de confirmation
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Successfully added $n ${coffee.name}(s) to cart!"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Ferme la boîte de dialogue
          },
          child: Text("OK"),
        ),
      ],
    ),
  );

  // Attends quelques secondes avant de naviguer vers 'acceuil'
  Future.delayed(Duration(milliseconds: 1500), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => acceuil()));
  });
}





  @override
  Widget build(BuildContext context) {
    return Consumer<Compteurcafe>(builder: (context,value,child)=> Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(height: 100,),
            // Image du café
            Flexible(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Image.asset(
      widget.coffee.name == 'esspresso' 
          ? 'images/espresso.png'
          : widget.coffee.name == 'black coffee'
              ? 'images/kahla.png'
          : widget.coffee.name == 'Cappucino'
              ? 'images/cappucino.png'    
              : 'images/kaskahwa.png', 
      fit: BoxFit.contain,
    ),
  ),
),


            const SizedBox(height: 30),

            // Texte "Quantity"
            const Text(
              "Quantity",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 15),

            // Boutons pour ajuster la quantité
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {value.decrease();},
                  icon: Icon(Icons.remove),
                  iconSize: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    value.cmpt.toString(), // Mettez ici la quantité
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {value.add();},
                  icon: Icon(Icons.add),
                  iconSize: 30,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Texte "Size"
            const Text(
              "Size",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 15),

            // Boutons pour la taille (S, M, L)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("S"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("M"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("L"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Bouton "ADD TO CART"
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addToCart(widget.coffee,value.cmpt );

                },
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.brown, // Changez la couleur si vous le souhaitez
                ),
              ),
            ),
          ],
        ),
      ),
    )
    
    
    
    
    );
  }
}
