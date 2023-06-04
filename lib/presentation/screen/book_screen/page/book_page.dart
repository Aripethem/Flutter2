import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tugas2/data/datasource/book/book_datasource.dart';
import 'package:flutter_tugas2/data/repository/book_repository_impl.dart';
import 'package:flutter_tugas2/domain/use_case/book/get_books_use.dart';
import 'package:flutter_tugas2/presentation/screen/book_screen/controller/book_controller.dart';
import 'package:flutter_tugas2/presentation/screen/book_screen/page/home_page.dart';
import 'package:flutter_tugas2/presentation/state/data_state.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class BookPage extends StatelessWidget {
  BookPage({super.key});

  final bookController = BookController(
    GetBooksUseCase(
      BookRepositoryImpl(
        BookDatasource(Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BookController>(
        init: bookController,
        initState: (state) => bookController.getBook(),
        builder: (controller) {
          if (controller.bookState.value.isSuccess) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: bookController.books.length,
              itemBuilder: (context, index) {
                final book = bookController.books[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Card(
                    color: Colors.amber,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    shadowColor: Colors.blueGrey,
                    child: Row(
                      children: [
                        Image.network(
                          book.image,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                book.title,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(book.subtitle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
