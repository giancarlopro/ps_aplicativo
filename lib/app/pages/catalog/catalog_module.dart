import 'dart:io';

import 'package:aplicativo/app/pages/catalog/catalog_page.dart';
import 'package:aplicativo/app/repositories/category_repository.dart';
import 'package:aplicativo/app/repositories/company_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CatalogPageModule extends ChildModule {
  static final categoryBaseUrl = '';

  static Inject get to => Inject<CatalogPageModule>.of();

  @override
  List<Bind> get binds => [
        Bind((i) => CompanyRepository(i.get())),
        Bind((i) => CategoryRepository(i.get())),
        Bind(
          (i) => Dio(
            BaseOptions(
              headers: {
                HttpHeaders.userAgentHeader:
                    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36',
              },
            ),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => CatalogPage()),
      ];
}
