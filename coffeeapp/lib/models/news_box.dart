import 'package:flutter/material.dart';
import 'news.dart';

class NewsBox with ChangeNotifier {
  // Initialisation de la liste des nouvelles avec des exemples de news
  final List<News> _newsList = [
    News(
      title: 'Coffee Benefits',
      description: 'A scientific article explaining the benefits of coffee.',
      imageUrl: 'images/kaskahwa.png',
      datePublished: DateTime.now(),
    ),
    News(
      title: 'Guide de préparation du café',
      description: 'Apprenez à préparer la tasse parfaite de café chez vous.',
      imageUrl: 'images/guide_cafe.png',
      datePublished: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      title: 'Les bienfaits du café',
      description: 'Un article scientifique sur les avantages du café pour la santé.',
      imageUrl: 'images/les_bienfaits.png',
      datePublished: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      title: 'Nouveautés sur le café',
      description: 'Découvrez les nouvelles variétés de café sur le marché.',
      imageUrl: 'images/new_coffee.png',
      datePublished: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  // Getter pour accéder à la liste
  List<News> get newsList => _newsList;

  // Méthode pour ajouter une nouvelle
  void addNews(News news) {
    _newsList.add(news);
    notifyListeners(); // Notifie les écouteurs que la liste a changé
  }

  // Méthode pour supprimer une nouvelle par index
  void removeNews(int index) {
    if (index >= 0 && index < _newsList.length) {
      _newsList.removeAt(index);
      notifyListeners(); // Notifie les écouteurs que la liste a changé
    }
  }

  // Méthode pour modifier une nouvelle existante
  void updateNews(int index, News newNews) {
    if (index >= 0 && index < _newsList.length) {
      _newsList[index] = newNews;
      notifyListeners(); // Notifie les écouteurs que la liste a changé
    }
  }
}
