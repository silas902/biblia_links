import 'package:biblia_links/bible/domain/entities/bible_online/reference_oline.dart';


class Chapter {
  final List<ReferenceOnline>? chepterReferences;
  
  final String idChapter;
  final String chapter;
  final String verses;
  final int chapterNumber;

  Chapter({
    required this.idChapter,
    required this.chapter,
    required this.verses,
    required this.chepterReferences,
    required this.chapterNumber,
  });
}
