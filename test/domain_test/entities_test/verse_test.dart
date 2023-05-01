import 'package:biblia_links/domain/entities/bible/verse.dart';
import 'package:biblia_links/domain/value_object/number_text_vo.dart';
import 'package:biblia_links/domain/value_object/quantity_of_letters_vo.dart';
import 'package:biblia_links/domain/value_object/text_vo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {



  group('verse_test erros group \n', () {

    test('verse_test erros (recebendo valor vazio)', () {
      final verseEnt = Verse(idVerse: TextVO(''), numberVerse: NumberTextVO('-1'), verse: QuantityOfLettersVO(''));

      expect(verseEnt.idVerse.validate(), '$TextVO esta vazio');
      expect(verseEnt.verse.validate(), '$QuantityOfLettersVO um versiculo não pode ter menos que 11 letras');
      expect(verseEnt.numberVerse.validate(), '$NumberTextVO valor só pode ser negativo');
    
    });

    test('verse_test erros (recebendo valor com espaco em branco)', () {
      final verseEnt = Verse(idVerse: TextVO('  '), numberVerse: NumberTextVO(' '), verse: QuantityOfLettersVO('  '));

      expect(verseEnt.idVerse.validate(), '$TextVO esta somente com espaço em branco');
      expect(verseEnt.verse.validate(), 'QuantityOfLettersVO um versiculo não pode ter menos que 11 letras');
      expect(verseEnt.numberVerse.validate(), '$NumberTextVO valor só pode ser inteiro sem caracteres especiais ou espaço em branco');
      
    });

   });

   group('verse_test acert group', () { });

  test('verse_test acert', () {
    final verseEnt = Verse(idVerse: TextVO('123'), numberVerse: NumberTextVO('1'), verse: QuantityOfLettersVO('testando ddddsdsdssds'));

    expect(verseEnt.idVerse.validate(), null);
    expect(verseEnt.verse.validate(), null);
    expect(verseEnt.numberVerse.validate(), null);
    expect(verseEnt.numberVerse.validate(), null);
  });
}
