// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';


import 'package:biblia_links/domain/entities/bible/chapter.dart';

import 'package:biblia_links/domain/value_object/text_vo.dart';

class Book {
  final TextVO idBook;
  final TextVO nameBook;
  final List<Chapter> chapters;
  Book({
    required this.idBook,
    required this.nameBook,
    required this.chapters,
  });

  
}
