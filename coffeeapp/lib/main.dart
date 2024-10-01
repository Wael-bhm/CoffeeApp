import 'package:coffeeapp/models/coffee_shop.dart';
import 'package:coffeeapp/models/compteurcafe.dart'; // Par exemple, un autre modèle de panier
import 'package:coffeeapp/models/compteurcafe.dart';
import 'package:coffeeapp/models/news_box.dart';
import 'package:coffeeapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (context) => NewsBox()),
        ChangeNotifierProvider(create: (context) => CoffeeShop()),
        ChangeNotifierProvider(create: (context) => Compteurcafe()),  // Exemple d'un autre ChangeNotifier
        // Ajoutez autant de ChangeNotifierProvider que nécessaire
      ],
      child: MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
