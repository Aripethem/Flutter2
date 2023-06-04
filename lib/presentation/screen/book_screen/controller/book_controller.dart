import 'package:flutter_tugas2/data/model/book_model.dart';
import 'package:flutter_tugas2/domain/use_case/book/get_books_use.dart';
import 'package:flutter_tugas2/presentation/state/data_state.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  final GetBooksUseCase _getBookUseCase;

  BookController(this._getBookUseCase);

  RxList<Book> books = <Book>[].obs;
  Rx<DataState> bookState = Rx(DataState.inital);

  void getBook() async {
    bookState(DataState.loading);
    update();
    final result = await _getBookUseCase();
    books(result);
    bookState(DataState.success);
    update();
  }
}
