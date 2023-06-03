import 'dart:convert';
import 'package:biblia_links/bible/data_sources/bibles_data_source.dart';
import 'package:biblia_links/bible/domain/entities/bible/bible.dart';
import 'package:biblia_links/bible/domain/usercases/get_bible_local/get_bible_local_usercase_imp.dart';
import 'package:biblia_links/bible/utils/list_of_bible_books_constante.dart';
import 'package:biblia_links/errors/failure.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/list_of_information_of_each_book_of_the_bible.dart';

class BibleDataSourceMock implements BibleDataSource {
  List<Map<String, dynamic>> books = [];
  List booksOfBible = ListOfBibleBooksConstante.bookNames;

  @override
  Future<List<Map<String, dynamic>>> getBibles() async {
    books.clear();
    for (var i = 0; i < booksOfBible.length; i++) {
      String bookJson = await rootBundle.loadString('assets/biblia_acf/${booksOfBible[i]}');
      final dynamic jsonResponse = jsonDecode(bookJson);

      books.add(jsonResponse);
    }

    return books;
  }
}

class DataSourceFormatExceptionErroMock implements BibleDataSource {
  List<Map<String, dynamic>> books = [];
  List booksOfBible = ListOfBibleBooksConstante.bookNames;

  @override
  Future<List<Map<String, dynamic>>> getBibles() async {
    books.clear();
    for (var i = 0; i < booksOfBible.length; i++) {
      String bookJson = await rootBundle.loadString('assets/biblia_af/${booksOfBible[i]}');
      final dynamic jsonResponse = jsonDecode(bookJson);

      books.add(jsonResponse);
    }

    return books;
  }
}

class DataSourceFormatExceptionErrorMock implements BibleDataSource {
  String locale = """{
    "2 João": [
        {
            "1": {
                "1": "O ancião à senhora eleita, e a seus filhos, aos quais amo na verdade, e não somente eu, mas também todos os que têm conhecido a verdade,",
                "2": "Por amor da verdade que está em nós, e para sempre estará conosco:",
                "3": "Graça, misericórdia e paz, da parte de Deus Pai e da do Senhor Jesus Cristo, o Filho do Pai, seja convosco na verdade e amor.",
                "4": "Muito me alegro por achar que alguns de teus filhos andam na verdade, assim como temos recebido o mandamento do Pai.",
                "5": "E agora, senhora, rogo-te, não como escrevendo-te um novo mandamento, mas aquele mesmo que desde o princípio tivemos: que nos amemos uns aos outros.",
                "6": "E o amor é este: que andemos segundo os seus mandamentos. Este é o mandamento, como já desde o princípio ouvistes, que andeis nele.",
                "7": "Porque já muitos enganadores entraram no mundo, os quais não confessam que Jesus Cristo veio em carne. Este tal é o enganador e o anticristo.",
                "8": "Olhai por vós mesmos, para que não percamos o que temos ganho, antes recebamos o inteiro galardão.",
                "9": "Todo aquele que prevarica, e não persevera na doutrina de Cristo, não tem a Deus. Quem persevera na doutrina de Cristo, esse tem tanto ao Pai como ao Filho.",
                "10": "Se alguém vem ter convosco, e não traz esta doutrina, não o recebais em casa, nem tampouco o saudeis.",
                "11": "Porque quem o saúda tem parte nas suas más obras.",
                "12": "Tendo muito que escrever-vos, não quis fazê-lo com papel e tinta; mas espero ir ter convosco e falar face a face, para que o nosso gozo seja cumprido.",
                "13": "Saúdam-te os filhos de tua irmã, a eleita. Amém."
            }
        }
    ]
     "3 João": [
        {
            "1": {
                "1": "O presbítero ao amado Gaio, a quem em verdade eu amo.",
                "2": "Amado, desejo que te vá bem em todas as coisas, e que tenhas saúde, assim como bem vai a tua alma.",
                "3": "Porque muito me alegrei quando os irmãos vieram, e testificaram da tua verdade, como tu andas na verdade.",
                "4": "Não tenho maior gozo do que este, o de ouvir que os meus filhos andam na verdade.",
                "5": "Amado, procedes fielmente em tudo o que fazes para com os irmãos, e para com os estranhos,",
                "6": "Que em presença da igreja testificaram do teu amor; aos quais, se conduzires como é digno para com Deus, bem farás;",
                "7": "Porque pelo seu Nome saíram, nada tomando dos gentios.",
                "8": "Portanto, aos tais devemos receber, para que sejamos cooperadores da verdade.",
                "9": "Tenho escrito à igreja; mas Diótrefes, que procura ter entre eles o primado, não nos recebe.",
                "10": "Por isso, se eu for, trarei à memória as obras que ele faz, proferindo contra nós palavras maliciosas; e, não contente com isto, não recebe os irmãos, e impede os que querem recebê-los, e os lança fora da igreja.",
                "11": "Amado, não sigas o mal, mas o bem. Quem faz o bem é de Deus; mas quem faz o mal não tem visto a Deus.",
                "12": "Todos dão testemunho de Demétrio, até a mesma verdade; e também nós testemunhamos; e vós bem sabeis que o nosso testemunho é verdadeiro.",
                "13": "Tinha muito que escrever, mas não quero escrever-te com tinta e pena.",
                "14": "Espero, porém, ver-te brevemente, e falaremos face a face. Paz seja contigo. Os amigos te saúdam. Saúda os amigos por nome."
            }
        }
    ]
  }""";

  @override
  Future<List<Map<String, dynamic>>> getBibles() async {
    List<Map<String, dynamic>> pase = await jsonDecode(locale);
    return pase;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('dados corretos \n', () {
    GetBiblesLocalUseCaseImp getBibleLocalUserCaseImp = GetBiblesLocalUseCaseImp(bibleDataSource: BibleDataSourceMock());

    //
    List<List<dynamic>> infoBooks = ListOfInformationOfEachBookOfTheBible.bibleInfo;
    test('Espero retornar uma list<Bible>', () async {
      expect(await getBibleLocalUserCaseImp.call(), isA<List<Bible>>());
    });

    test('Espero retornar o nome de cada livro da biblia', () async {
      List<Bible> bibles = await getBibleLocalUserCaseImp.call();

      for (var i = 0; i < infoBooks.length; i++) {
        List list = infoBooks[i];
        expect(bibles[0].books[i].nameBook.value, list[0].toString());
      }
    });

    test('Espero retornar a quantidade de capitulos', () async {
      List<Bible> bibles = await getBibleLocalUserCaseImp.call();

      for (var i = 0; i < infoBooks.length; i++) {
        List list = infoBooks[i];
        expect(bibles[0].books[i].chapters.length.toString(), list[1].toString());
      }
    });
    test('Espero retornar a quantidade de versiculos', () async {
      List<Bible> bibles = await getBibleLocalUserCaseImp.call();

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
    test('Espero retornar um FlutterError', () {
      GetBiblesLocalUseCaseImp userCaseErroruserCaseError = GetBiblesLocalUseCaseImp(bibleDataSource: DataSourceFormatExceptionErroMock());
      expect(userCaseErroruserCaseError.call(), throwsFlutterError);
    });

    test('Espero retornar um FormatException', () {
      GetBiblesLocalUseCaseImp userCaseError = GetBiblesLocalUseCaseImp(bibleDataSource: DataSourceFormatExceptionErrorMock());
      expect(userCaseError.call(), throwsFormatException);
    });
  });
}
