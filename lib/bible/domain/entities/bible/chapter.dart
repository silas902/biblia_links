
import 'package:biblia_links/bible/domain/entities/bible/verse.dart';
import 'package:biblia_links/bible/domain/value_object/number_text_vo.dart';
import 'package:biblia_links/bible/domain/value_object/text_vo.dart';

class Chapter {
  final TextVO idChapter;
  final NumberTextVO chapterNumber;
  final List<Verse> verses;

  Chapter({
    required this.idChapter,
    required this.chapterNumber,
    required this.verses,
  });

  

}
