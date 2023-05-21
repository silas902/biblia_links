import 'package:biblia_links/bible/domain/entities/bible/chapter.dart';
import 'package:biblia_links/bible/domain/value_object/text_vo.dart';
class Book {
  final TextVO idBook;
  final TextVO nameBook;
  final List<Chapter> chapters;
  Book({
    required this.idBook,
    required this.nameBook,
    required this.chapters,
  });

  Book validate() {
    String? idValidi = idBook.validate();
    String? nameValidi = nameBook.validate();
    if(idValidi  == null && nameValidi == null){
       return this;
    } else {
      return Book(idBook: idBook, nameBook: nameBook, chapters: chapters); 
    }
  }
}
