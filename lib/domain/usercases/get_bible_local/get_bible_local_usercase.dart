import 'package:biblia_links/domain/entities/bible/bible.dart';

abstract class GetBibleLocalUseCase {
  Future<List<Bible>> call();
}