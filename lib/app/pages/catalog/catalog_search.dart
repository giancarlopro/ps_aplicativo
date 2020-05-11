import 'package:aplicativo/app/pages/catalog/catalog_module.dart';
import 'package:aplicativo/app/repositories/category_repository.dart';
import 'package:aplicativo/app/repositories/company_repository.dart';
import 'package:flutter/material.dart';

class CatalogSearchDelegate extends SearchDelegate {
  final CompanyRepository companies =
      CatalogPageModule.to.get<CompanyRepository>();
  final CategoryRepository categories =
      CatalogPageModule.to.get<CategoryRepository>();

  static final queries = <String>[];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Future<List<Widget>> _buildResults(BuildContext context) async {
    var foundCompanies = await companies.search(query);
    var foundCategories = await categories.search(query);

    final cards = <Widget>[];

    for (var company in foundCompanies) {
      cards.add(
        Card(
          child: ListTile(
            leading: Image.network(company.logo),
            title: Text(company.fantasyName),
            onTap: () => close(context, company),
          ),
        ),
      );
    }

    for (var category in foundCategories) {
      cards.add(
        Card(
          child: ListTile(
            leading: Image.network(category.image),
            title: Text(category.name),
          ),
        ),
      );
    }

    return cards;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _buildResults(context),
      builder: (context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: snapshot.data ?? [],
          );
        } else {
          return Text('Carregando...');
        }
      },
    );
  }

  Future<List<Card>> _buildSuggestions(BuildContext context) async {
    final cards = <Widget>[];

    for (var pastQuery in queries) {
      cards.add(
        Card(
          child: ListTile(
            title: Text(pastQuery),
            onTap: () {
              query = pastQuery;
            },
          ),
        ),
      );
    }

    return cards;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: _buildSuggestions(context),
      builder: (context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: snapshot.data ?? [],
          );
        } else {
          return Text('Carregando...');
        }
      },
    );
  }
}
