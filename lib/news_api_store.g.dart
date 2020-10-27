// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsApiStore on _NewsApiStoreBase, Store {
  final _$topNewsApiModelAtom = Atom(name: '_NewsApiStoreBase.topNewsApiModel');

  @override
  TopNewsApiModel get topNewsApiModel {
    _$topNewsApiModelAtom.reportRead();
    return super.topNewsApiModel;
  }

  @override
  set topNewsApiModel(TopNewsApiModel value) {
    _$topNewsApiModelAtom.reportWrite(value, super.topNewsApiModel, () {
      super.topNewsApiModel = value;
    });
  }

  final _$_NewsApiStoreBaseActionController =
      ActionController(name: '_NewsApiStoreBase');

  @override
  dynamic fetchData() {
    final _$actionInfo = _$_NewsApiStoreBaseActionController.startAction(
        name: '_NewsApiStoreBase.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_NewsApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
topNewsApiModel: ${topNewsApiModel}
    ''';
  }
}
