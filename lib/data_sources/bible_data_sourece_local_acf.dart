import 'dart:convert';

import 'package:biblia_links/utils/list_of_bible_books_constante.dart';
import 'package:flutter/services.dart';

import 'bibles_data_source.dart';

class BibleDataSourceLocalACFImp implements BibleDataSource {
  @override
  Future<List<Map<String, dynamic>>> getBibles() async {
    List booksOfBible = ListOfBibleBooksConstante.bookNames;
    List<Map<String, dynamic>> books = [];
    books.clear();

    for (var i = 0; i < booksOfBible.length; i++) {
      String bookJson = await rootBundle.loadString('assets/biblia_acf/${booksOfBible[i]}');
      final dynamic jsonResponse = jsonDecode(bookJson);

      books.add(jsonResponse);
    }

    return books;
  }
}
