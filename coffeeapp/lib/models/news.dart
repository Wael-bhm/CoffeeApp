class News {
  final String title;       // Titre de l'article ou de la notification
  final String description; // Description ou contenu de la nouvelle
  final String imageUrl;    // URL ou chemin de l'image associée à la nouvelle
  final DateTime datePublished; // Date de publication de la nouvelle

  // Constructeur de la classe News
  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.datePublished,
  });

  // Méthode pour formater la date dans un format lisible
  String getFormattedDate() {
    return "${datePublished.day}-${datePublished.month}-${datePublished.year}";
  }
}
