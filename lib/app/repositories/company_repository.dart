import 'package:aplicativo/app/models/company.dart';
import 'package:aplicativo/app/repositories/base_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CompanyRepository extends BaseRepository {
  CompanyRepository(
    Dio client, {
    String baseUrl = 'http://www.mocky.io/v2/5eac692c3300003941dfe3d8',
  }) : super(client, baseUrl);

  Future<List<Company>> all() {
    return get<List<Company>>('companies/');
  }

  Future<List<Company>> search(String query) {
    return get<List<Company>>('companies/', queryParameters: {'q': query});
  }

  Future<Company> find(double id) {
    return get<Company>("companies/$id");
  }

  @override
  void dispose() {}
}
