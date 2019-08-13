import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:plute/model/search_result.dart';

part 'book_api.g.dart';

class BookApi = _BookApi with _$BookApi;

abstract class _BookApi with Store {
  static final String _opUrl = "https://openlibrary.org";
  static final String _searchOpUrl = '$_opUrl/search.json';

  @observable
  List<SearchResult> results = [];

  @action
  Future<SearchResult> search(String query) async {
    String q = '$_searchOpUrl?q=$query';
    http.Response response = await http
        .get(Uri.encodeFull(q), headers: {"Accept": "application/json"});
    if (response.statusCode != 200) {
      return json.decode(response.body);
    }
    print(json.decode(response.body));
    return SearchResult.fromMap(json.decode(response.body));
  }
}
