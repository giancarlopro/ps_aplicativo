import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class BaseRepository extends Disposable {
  Dio client;
  String baseUrl;

  BaseRepository(this.client, this.baseUrl);

  Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    var response =
        await client.get<T>(baseUrl + path, queryParameters: queryParameters);

    if (response.statusCode != 200) {
      throw Exception('Não foi possível acessar a api');
    }

    return response.data;
  }
}
