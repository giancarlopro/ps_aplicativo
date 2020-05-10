class Category {
  String name;
  String image;

  Category({this.name, this.image});

  static Category fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      image: json['image'],
    );
  }

  static List<Category> fromJsonArray(List<Map<String, dynamic>> json) {
    return json.map((j) => fromJson(j));
  }
}
