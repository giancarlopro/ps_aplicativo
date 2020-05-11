import 'package:aplicativo/app/models/category.dart';
import 'package:aplicativo/app/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class CategoryRepository extends BaseRepository {
  CategoryRepository(
    Dio client, {
    String baseUrl = 'http://localhost:3000/api/',
  }) : super(client, baseUrl);

  Future<List<Category>> all() async {
    final response = await get<List<dynamic>>('categories/');

    return Category.fromJsonArray(response);
  }

  Future<List<Category>> search(String query) async {
    final response = await get<List<dynamic>>(
      'categories/',
      queryParameters: {'q': query},
    );

    return Category.fromJsonArray(response);
  }

  Future<Category> find(double id) async {
    final response = await get<Map<String, dynamic>>("categories/$id");

    return Category.fromJson(response);
  }

  @override
  void dispose() {}
}
