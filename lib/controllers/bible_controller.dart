// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:biblia_links/data_sources/bible_data_sourece_local_acf.dart';

import 'package:biblia_links/domain/usercases/get_bible_local/get_bible_local_usercase_imp.dart';

import '../domain/entities/bible/bible.dart';

class BibleLocalController {
  List<Bible> biblesLocal = [];
  GetBiblesLocalUseCaseImp getBiblesLocalUseCaseImp = GetBiblesLocalUseCaseImp(bibleDataSource: BibleDataSourceLocalACFImp());


  
  Future getBibleLocal() async {
    biblesLocal = await getBiblesLocalUseCaseImp.call();
  }

  
}
