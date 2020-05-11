class Category {
  double id;
  String name;
  String image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  static Category fromJson(Map<String, dynamic> json) {
    return Category(
      id: (json['id'] as int).toDouble(),
      name: json['name'],
      image: json['image'],
    );
  }

  static List<Category> fromJsonArray(List<Map<String, dynamic>> json) {
    return json.map((j) => fromJson(j)).toList();
  }
}
