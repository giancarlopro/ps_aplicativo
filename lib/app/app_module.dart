// extends from MainModule
import 'package:aplicativo/app/app_widget.dart';
import 'package:aplicativo/app/pages/catalog/catalog_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [Router('/', module: CatalogPageModule())];

  @override
  Widget get bootstrap => AppWidget();
}
