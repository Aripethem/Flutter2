import 'dart:math';

import 'package:flutter_tugas2/data/datasource/book/book_datasource.dart';
import 'package:flutter_tugas2/data/model/book_model.dart';
import 'package:flutter_tugas2/domain/respository/book_respsitory.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDatasource _remoteDatasource;

  const BookRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<Book>> getBooks() async {
    try {
      final result = await _remoteDatasource.getBooks();

      if (result != null && result.books != null) {
        return result.books;
      }
      return [];
    } catch (e, stacktrace) {
      log('Error on BookRepositoryImpl ${e.toString()}: $stacktrace' as num);
      return [];
    }
  }
}
