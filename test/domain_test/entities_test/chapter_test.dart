import 'package:biblia_links/bible/domain/entities/bible/chapter.dart';
import 'package:biblia_links/bible/domain/entities/bible/verse.dart';
import 'package:biblia_links/bible/domain/value_object/number_text_vo.dart';
import 'package:biblia_links/bible/domain/value_object/quantity_of_letters_vo.dart';
import 'package:biblia_links/bible/domain/value_object/text_vo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('chapter_test erros group \n', () {
    //final verseEnt = Verse(idVerse: TextVO('123'), numberVerse: NumberVO(1), verse: QuantityOfLettersVO('testando ddddsdsdssds'));
    List<Verse> verses = [
      Verse(idVerse: TextVO('123'), numberVerse: NumberTextVO('1'), verse: QuantityOfLettersVO('testando ddddsdsdssds'))
    ];

    test('chapter_test erros (recebando valor vazio)', () {
      final chapterEnt = Chapter(idChapter: TextVO(''), chapterNumber: NumberTextVO(''), verses: verses);

      expect(chapterEnt.idChapter.validate(), '$TextVO esta vazio');
      expect(chapterEnt.chapterNumber.validate(), '$NumberTextVO esta vazio');
      
    });

    test('chapter_test erros (recebando valor somente com espaco em branco)', () {
      final chapterEnt = Chapter(idChapter: TextVO('  '), chapterNumber: NumberTextVO('  '), verses: verses,);

      expect(chapterEnt.idChapter.validate(), '$TextVO esta somente com espaço em branco');
     // expect(chapterEnt.chapterNumber.validate(), '$NumberTextVO esta somente com espaço em branco');
      expect(chapterEnt.chapterNumber.validate(), '$NumberTextVO valor só pode ser inteiro sem caracteres especiais ou espaço em branco');
    });
  });

  group('chapter_test acert group', () {
    test('verse_test acert', () {
      List<Verse> verses = [
      Verse(idVerse: TextVO('123'), numberVerse: NumberTextVO('1'), verse: QuantityOfLettersVO('testando ddddsdsdssds'))
    ];

      final chapterEnt = Chapter(idChapter: TextVO('idChapter'), verses: verses, chapterNumber: NumberTextVO('23'));

      expect(chapterEnt.idChapter.validate(), null);
      expect(chapterEnt.chapterNumber.validate(), null);
      expect(chapterEnt.chapterNumber.validate(), null);
      
    });
  });
}
