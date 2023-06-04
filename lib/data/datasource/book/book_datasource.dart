import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tugas2/data/model/book_model.dart';

class BookDatasource {
  final Dio _client;

  const BookDatasource(this._client);

  Future<BookResponse?> getBooks() async {
    try {
      final result = await _client.get('https://api.itbook.store/1.0/new');

      if (result.statusCode == 200) {
        return BookResponse.fromJson(result.data);
      }
      return null;
    } catch (e, stacktrace) {
      log("Error on book datasource ${e.toString()}: $stacktrace" as num);
      return null;
    }
  }
}
