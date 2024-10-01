import 'package:coffeeapp/pages/acceuil.dart';
import 'package:coffeeapp/pages/cart_page.dart';
import 'package:coffeeapp/pages/nombre_cafe.dart';
import 'package:coffeeapp/pages/shop_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/mybar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 214, 160),
      body: Column(
      children: [
        SizedBox(height:150),
        Image.asset('images/Mycoffee.png'),

        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            'French Brew',
            style: TextStyle(
              fontSize: 36,  // Taille plus grande pour bien mettre en valeur le titre
              fontWeight: FontWeight.bold,  // Texte en gras pour le rendre accrocheur
              color: Color(0xFF6F4E37),  // Couleur café, un brun chaleureux
              letterSpacing: 2.0,  // Espacement des lettres pour un look plus raffiné
              shadows: [
                Shadow(
          offset: Offset(2.0, 2.0),  // Légère ombre pour donner du relief
          blurRadius: 3.0,
          color: Colors.black.withOpacity(0.3),  // Ombre douce
                ),
              ],
            ),
            textAlign: TextAlign.center,  // Centrer le texte pour une présentation élégante
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40,top:50),
          child: Text('How do you like your coffee ... ?',style: TextStyle(fontSize:20,color: Color(0xff3f494b),
          fontWeight:FontWeight.w400,
          letterSpacing: 1.0),),
        )
        ,
        Padding(
          padding: const EdgeInsets.only(right: 15,left: 15),
          child: ElevatedButton(
            
          onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const acceuil())) ,
             style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // Enlever le padding par défaut du bouton
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Rayon des coins du bouton
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
           child: Center(child: Text("Start My Day Again With A Coffee ",
           
           style: TextStyle(fontFamily: 'Lobster',color:Color.fromARGB(255, 239, 237, 234),
           
           fontSize: 24),)),
           
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color.fromARGB(255, 122, 94, 65)),
            
            
            ),
          ),
        )
      ],
    ),
    );
  }
}



