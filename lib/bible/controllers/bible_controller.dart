// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:biblia_links/bible/data_sources/bible_data_sourece_local_acf_imp.dart';

import 'package:biblia_links/bible/domain/usercases/get_bible_local/get_bible_local_usercase_imp.dart';
import 'package:flutter/material.dart';

import '../domain/entities/bible/bible.dart';

class BibleLocalController extends ChangeNotifier {
  final GetBiblesLocalUseCaseImp _getBiblesLocalUseCaseImp = GetBiblesLocalUseCaseImp(bibleDataSource: BibleDataSourceLocalACFImp());
  List<Bible> biblesLocal = [];

  Future<String> getBibleLocal({required BuildContext context}) async {
    try {
      var response = await _getBiblesLocalUseCaseImp.call();

      biblesLocal = response;
      return '';
    } catch (e) {
      return 'Error na busca da biblia, reinicie o aplicativo ';
    }
  }
}
