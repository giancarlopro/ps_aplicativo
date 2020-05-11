import 'package:aplicativo/app/models/company.dart';
import 'package:aplicativo/app/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class CompanyRepository extends BaseRepository {
  CompanyRepository(
    Dio client, {
    String baseUrl = 'http://localhost:3000/api/',
  }) : super(client, baseUrl);

  Future<List<Company>> all() async {
    final response = await get<List<dynamic>>('companies/');

    return Company.fromJsonArray(response);
  }

  Future<List<Company>> search(String query) async {
    final response = await get<List<dynamic>>(
      'companies/',
      queryParameters: {'q': query},
    );

    return Company.fromJsonArray(response);
  }

  Future<Company> find(double id) async {
    final response = await get<Map<String, dynamic>>("companies/$id");

    return Company.fromJson(response);
  }

  @override
  void dispose() {}
}
