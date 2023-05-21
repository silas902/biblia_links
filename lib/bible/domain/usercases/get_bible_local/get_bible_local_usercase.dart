import 'package:biblia_links/bible/domain/entities/bible/bible.dart';

abstract class GetBibleLocalUseCase {
  Future<List<Bible>> call();
}