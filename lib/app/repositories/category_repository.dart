import 'package:aplicativo/app/models/category.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryRepository extends Disposable {
  final Dio client;

  CategoryRepository(this.client);

  Future<List<Category>> search(String query) async {
    final response = await client.get<List<Category>>('companies/');

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Não foi possível acessar a api');
    }
  }

  Future<Category> find(double id) async {
    final response = await client.get<Category>("companies/$id");

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Não foi possível acessar a api');
    }
  }

  @override
  void dispose() {}
}
