import 'package:flutter_tugas2/data/model/book_model.dart';
import 'package:flutter_tugas2/domain/respository/book_respsitory.dart';

class GetBooksUseCase {
  final BookRepository _repository;

  const GetBooksUseCase(this._repository);

  Future<List<Book>> call() async => _repository.getBooks();
}
