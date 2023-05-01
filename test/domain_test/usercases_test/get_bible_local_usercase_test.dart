import 'dart:convert';

import 'package:biblia_links/data_sources/bible_data_sourece_local_acf.dart';
import 'package:biblia_links/data_sources/bibles_data_source.dart';
import 'package:biblia_links/domain/entities/bible/bible.dart';
import 'package:biblia_links/domain/usercases/get_bible_local/get_bible_local_usercase_imp.dart';
import 'package:biblia_links/utils/list_of_bible_books_constante.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/list_of_information_of_each_book_of_the_bible.dart';

//class BibleDataSourceMock implements BibleDataSource {
//  List<Map<String, dynamic>> books = [];
//  List booksOfBible = ListOfBibleBooksConstante.bookNames;
//
//  @override
//  Future<List<Map<String, dynamic>>> getBibles() async {
//    books.clear();
//    for (var i = 0; i < booksOfBible.length; i++) {
//      String bookJson = await rootBundle.loadString('assets/biblia_acf/${booksOfBible[i]}');
//      final dynamic jsonResponse = jsonDecode(bookJson);
//
//      books.add(jsonResponse);
//    }
//
//    return books;
//  }
//}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final BibleDataSourceLocalACFImp bibleDataSourceLocalACF = BibleDataSourceLocalACFImp();

  GetBiblesLocalUseCaseImp getBibleLocalUserCaseImp = GetBiblesLocalUseCaseImp(bibleDataSource: bibleDataSourceLocalACF);
  List<Bible> bibles = await getBibleLocalUserCaseImp.call();
  List<List<dynamic>> infoBooks = ListOfInformationOfEachBookOfTheBible.bibleInfo;
  group('dados corretos \n', () {
    test('Espero retornar uma list<Bible>', () async {
      expect(await getBibleLocalUserCaseImp.call(), isA<List<Bible>>());
    });

    test('Espero retornar o nome de cada livro da biblia', () async {
      for (var i = 0; i < infoBooks.length; i++) {
        List list = infoBooks[i];
        expect(bibles[0].books[i].nameBook.value, list[0].toString());
      }
    });

    test('Espero retornar a quantidade de capitulos', () async {
      for (var i = 0; i < infoBooks.length; i++) {
        List list = infoBooks[i];
        expect(bibles[0].books[i].chapters.length.toString(), list[1].toString());
      }
    });
    test('Espero retornar a quantidade de versiculos', () async {
      for (var i = 0; i < infoBooks.length; i++) {
        List listBooks = infoBooks[i];
        List listVeses = listBooks[2];
        for (var e = 0; e < listVeses.length; e++) {
          //print(listBooks[0].toString());
          //print(bibles[0].books[i].chapters[e].chapterNumber.value);
          expect(
            bibles[0].books[i].chapters[e].verses.length.toString(),
            listVeses[e].toString(),
          );
        }
      }
    });
  });
  group('dados incorretos', () {
    test('Espero retornar uma list<Bible>', () async {
      expect(await getBibleLocalUserCaseImp.call(), isA<List<Bible>>());
    });
    test('Espero retornar a quantidade de capitulos', () async {
      expect(bibles[0].books[0].chapters.length, 6);
    });
    test('Espero retornar a quantidade de versiculos', () async {
      expect(bibles[0].books[0].chapters[0].verses.length, 20);
    });
    test('Espero retornar o nome do livro', () async {
      expect(bibles[0].books[0].nameBook.value, '1 timoteo');
    });
  });
}
