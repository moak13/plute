// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$BookApi on _BookApi, Store {
  final _$resultsAtom = Atom(name: '_BookApi.results');

  @override
  List<SearchResult> get results {
    _$resultsAtom.context.enforceReadPolicy(_$resultsAtom);
    _$resultsAtom.reportObserved();
    return super.results;
  }

  @override
  set results(List<SearchResult> value) {
    _$resultsAtom.context.conditionallyRunInAction(() {
      super.results = value;
      _$resultsAtom.reportChanged();
    }, _$resultsAtom, name: '${_$resultsAtom.name}_set');
  }

  final _$searchAsyncAction = AsyncAction('search');

  @override
  Future<SearchResult> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }
}
