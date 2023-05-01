import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:biblia_links/data_sources/bibles_data_source.dart';
import 'package:biblia_links/domain/entities/bible/bible.dart';
import 'package:biblia_links/domain/usercases/get_bible_local/get_bible_local_usercase.dart';

import '../../entities/bible/book.dart';
import '../../entities/bible/chapter.dart';
import '../../entities/bible/verse.dart';
import '../../value_object/number_text_vo.dart';
import '../../value_object/quantity_of_letters_vo.dart';
import '../../value_object/text_vo.dart';

class GetBiblesLocalUseCaseImp implements GetBibleLocalUseCase {
  final BibleDataSource bibleDataSource;
  GetBiblesLocalUseCaseImp({required this.bibleDataSource});

  final List<Book> _books = [];
  final Uuid uuid = const Uuid();
  @override
  Future<List<Bible>> call() async {
    List<Map<String, dynamic>> bibleJson = await bibleDataSource.getBibles();
    final List<Bible> bibles = [];

    for (var i = 0; i < bibleJson.length; i++) {
      assembleBook(bibleJson: bibleJson[i]);
      //assembleBook(bibleJson: bibleJson[i]);
    }
    bibles.add(Bible(
      idBible: TextVO(uuid.v4().toString()),
      books: _books,
    ));
    return bibles;
  }

  @visibleForTesting
  List<Book> assembleBook({required Map<String, dynamic> bibleJson}) {
    bibleJson.forEach(
      (key, value) {
        _books.add(
          Book(
            idBook: TextVO(uuid.v4().toString()),
            nameBook: TextVO(key),
            chapters: assembleChapter(chap: value),
          ),
        );
      },
    );
    return _books;
  }

  @visibleForTesting
  List<Chapter> assembleChapter({required List chap}) {
    final List<Chapter> chapters = [];
    for (var i = 0; i < chap.length; i++) {
      chap[i].forEach((key, value) {
        chapters.add(
          Chapter(
            idChapter: TextVO(uuid.v4().toString()),
            chapterNumber: NumberTextVO(key),
            verses: assembleverses(value: value),
          ),
        );
      });
    }
    return chapters;
  }

  @visibleForTesting
  assembleverses({required Map value}) {
    final List<Verse> verses = [];

    value.forEach((key, value) {
      verses.add(
        Verse(
          idVerse: TextVO(uuid.v4().toString()),
          numberVerse: NumberTextVO(key),
          verse: QuantityOfLettersVO(value),
        ),
      );
    });

    return verses;
  }
}
