import 'package:biblia_links/bible/data_sources/bible_data_sourece_local_acf_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BibleDataSourceLocalACFImp dataSourceLocal = BibleDataSourceLocalACFImp();

  test('Testando BibleDataSourceLocalACFImp com dados corretos', () async  {
    expect( await dataSourceLocal.getBibles(), isA<List<Map<String, dynamic>>>());
  });
}