import 'package:flutter/material.dart';
import 'package:coffeeapp/models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  final Widget icon;

  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Plus d'espace autour de la tuile
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey[100],
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(24), // Ajout de padding à l'intérieur de la tuile
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    coffee.imagepath,
                    height: 80, // Augmentation de la taille de l'image
                    width: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                
                // Détails du café
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee.name,
                          style: TextStyle(
                            fontSize: 20, // Taille de police plus grande
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${coffee.price} \dinars',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Bouton avec cercle coloré
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(251, 220, 188, 111), // Couleur de fond du cercle
                  ),
                  child: IconButton(
                    icon: icon,
                    onPressed: onPressed,
                    splashRadius: 28, // Rayon du splash plus grand
                    iconSize: 28, // Taille de l'icône
                    color: Colors.white, // Couleur de l'icône
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
