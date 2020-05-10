import 'package:aplicativo/app/models/category.dart';
import 'package:aplicativo/app/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class CategoryRepository extends BaseRepository {
  CategoryRepository(
    Dio client, {
    String baseUrl = 'http://www.mocky.io/v2/5eac697c330000dc64dfe3db',
  }) : super(client, baseUrl);

  Future<List<Category>> all() {
    return get<List<Category>>('categories/');
  }

  Future<List<Category>> search(String query) {
    return get<List<Category>>(
      'categories/',
      queryParameters: {'q': query},
    );
  }

  Future<Category> find(double id) {
    return get<Category>("categories/$id");
  }

  @override
  void dispose() {}
}
