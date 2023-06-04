import 'package:flutter_tugas2/data/model/book_model.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
}
