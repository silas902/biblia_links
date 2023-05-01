import 'package:biblia_links/domain/value_object/value_object.dart';

class TextVO extends ValueObject<String>{
  
  TextVO(
    super.value,
  );

  @override
  String? validate(){
    if(value.isEmpty) {
      return '$runtimeType esta vazio';
    } else if (value.trim().isEmpty){
      return '$runtimeType esta somente com espaço em branco';
    }
    return null;
  }

  toMap() {}

  static fromMap(Map<String, dynamic> map) {}
  
}
