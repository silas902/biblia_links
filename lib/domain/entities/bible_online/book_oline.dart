// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:biblia_links/domain/entities/bible_online/reference_oline.dart';

class Book {
  final String idBook;
  final String nameBook;
  final String chapters;
  final List<ReferenceOnline>? bookReferences;

  Book({
    required this.nameBook,
    required this.chapters,
    required this.bookReferences,
    required this.idBook,
  });
}
