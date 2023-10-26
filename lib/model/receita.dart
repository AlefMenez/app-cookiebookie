class Receita
 {
  String name;
  String ingredients;
  String preparation;
  String? imageUrl;

  Receita
  ({
    required this.name,
    required this.ingredients,
    required this.preparation,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ingredients': ingredients,
      'preparation': preparation,
      'imageUrl': imageUrl,
    };
  }

  factory Receita
  .fromJson(Map<String, dynamic> json) {
    return Receita
    (
      name: json['name'],
      ingredients: json['ingredients'],
      preparation: json['preparation'],
      imageUrl: json['imageUrl'],
    );
  }
  String toString() {
    return 'Name:' +
        this.name +
        'Ingredients: ' +
        this.ingredients +
        'Preparation: ' +
        this.preparation;
  }
}
