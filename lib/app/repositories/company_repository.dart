import 'package:aplicativo/app/models/company.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CompanyRepository extends Disposable {
  final Dio client;

  CompanyRepository(this.client);

  Future<List<Company>> search(String query) async {
    final response = await client.get<List<Company>>('companies/');

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Não foi possível acessar a api');
    }
  }

  Future<Company> find(double id) async {
    final response = await client.get<Company>("companies/$id");

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Não foi possível acessar a api');
    }
  }

  @override
  void dispose() {}
}
