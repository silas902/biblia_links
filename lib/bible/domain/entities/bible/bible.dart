
import 'package:biblia_links/bible/domain/entities/bible/book.dart';

import '../../value_object/text_vo.dart';


class Bible {
  
  final TextVO idBible;
  final List<Book> books;

  Bible({
    required this.idBible,
    required this.books,
  });

  

  
}
