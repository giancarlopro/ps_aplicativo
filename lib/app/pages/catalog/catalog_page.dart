import 'package:aplicativo/app/pages/catalog/catalog_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: CatalogSearchDelegate());
          },
        ),
        title: TextField(
          readOnly: true,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Pesquisar'),
          onTap: () {
            showSearch(context: context, delegate: CatalogSearchDelegate());
          },
        ),
      ),
    );
  }
}
