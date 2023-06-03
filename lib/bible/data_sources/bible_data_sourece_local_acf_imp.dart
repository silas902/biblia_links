import 'dart:convert';

import 'package:biblia_links/bible/errors/data_sources_erros/data_source_oflline_failure.dart';
import 'package:biblia_links/bible/utils/list_of_bible_books_constante.dart';
import 'package:biblia_links/errors/failure.dart';
import 'package:flutter/services.dart';

import 'bibles_data_source.dart';

class BibleDataSourceLocalACFImp implements BibleDataSource {
  @override
  Future<List<Map<String, dynamic>>> getBibles() async {
    try {
      List booksOfBible = ListOfBibleBooksConstante.bookNames;
      List<Map<String, dynamic>> booksJson = [];
      booksJson.clear();

      for (var i = 0; i < booksOfBible.length; i++) {
        String bookJson = await rootBundle.loadString('assets/biblia_acf/${booksOfBible[i]}');
        final dynamic jsonResponse = jsonDecode(bookJson);

        booksJson.add(jsonResponse);
      }

      return booksJson;
    } on FormatException catch (e) {
      throw JsonError(completeError: e.toString());
    } catch (e) {
      throw UnknownError(label: e.toString(), stackTrace: StackTrace.current);
    }
  }
}
