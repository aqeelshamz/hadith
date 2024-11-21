// hadith.dart

library hadith;

import 'classes.dart';
import 'enums.dart';
import 'hadith_service.dart';

void main() async {
  HadithService hadithService = HadithService();

  // Load books for Sahih Muslim
  List<Book> books = await hadithService.loadBooks(CollectionType.muslim);
  print('Books for Sahih Muslim:');
  for (var book in books) {
    print(book);
  }

  // Load hadiths for Sahih Muslim
  Map<String, dynamic> hadiths =
      await hadithService.loadHadiths(CollectionType.muslim);
  print('Hadiths for Sahih Muslim:');
  print(hadiths);
}
