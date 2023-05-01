// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:biblia_links/domain/value_object/number_text_vo.dart';
import 'package:biblia_links/domain/value_object/quantity_of_letters_vo.dart';
import 'package:biblia_links/domain/value_object/text_vo.dart';

class Verse {
  final TextVO idVerse;
  final NumberTextVO numberVerse;
  final QuantityOfLettersVO verse;
  Verse({
    required this.idVerse,
    required this.numberVerse,
    required this.verse,
  });
}
