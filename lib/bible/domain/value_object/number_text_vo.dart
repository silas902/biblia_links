import 'package:biblia_links/bible/domain/value_object/value_object.dart';

class NumberTextVO extends ValueObject<String> {
  NumberTextVO(super.value);

  @override
  String? validate() {
    if (value.isEmpty) {
      return '$runtimeType esta vazio';
    }
    if (!RegExp(r'^[-+]?[0-9]+$').hasMatch(value.toString())) {
      return '$runtimeType valor só pode ser inteiro sem caracteres especiais ou espaço em branco';
    }

    if (int.parse(value) < 0) {
      return '$runtimeType valor só pode ser negativo';
    }
    return null;
  }
}
