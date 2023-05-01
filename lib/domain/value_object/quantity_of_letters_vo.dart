import 'package:biblia_links/domain/value_object/text_vo.dart';
import 'package:biblia_links/domain/value_object/value_object.dart';

class QuantityOfLettersVO extends ValueObject<String> {
  QuantityOfLettersVO(super.value);

  @override
  String? validate() {
    if (value.trim().length < 11) {
      return '$runtimeType um versiculo não pode ter menos que 11 letras';
    } else {
      TextVO? textVO = TextVO(value);
      return textVO.validate();
    }
  }
}
