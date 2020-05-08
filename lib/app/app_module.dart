// extends from MainModule
import 'package:aplicativo/app/app_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  @override
  Widget get bootstrap => AppWidget();
}
