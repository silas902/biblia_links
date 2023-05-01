 import 'package:biblia_links/domain/value_object/text_vo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 test('text.value com valor vazio', () {
   final text = TextVO('');

   expect(text.value, '');

   expect(text.validate(), '$TextVO esta vazio');
 }); 

 test('text.value com valor prenchido', () {
  final text = TextVO('valor prénchido');
  
  expect(text.value, 'valor prénchido');

  expect(text.validate(), null);

 });
}