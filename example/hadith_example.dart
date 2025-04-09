import 'package:hadith/hadith.dart';

void main() {
  HadithService hadithService = HadithService();

  List<Collection> collections = await hadithService.getCollections();
  print('Available Collections:' + collections.toString());

  List<Book> books = await hadithService.getBooks(Collection.bukhari);
  print('Books for Sahih Bukhari:');
  for (var book in books) {
    print("${books.indexOf(book) + 1}. " + book.book[0].name);
  }

  Book book = await hadithService.getBook(Collection.bukhari, 1);
  print(book);

  List<Hadith> hadiths = await hadithService.getHadiths(Collection.bukhari, 1);
  print('Hadiths for Sahih Bukhari, Book 1: ${hadiths.length}');

  Hadith? hadith = await hadithService.getHadith(Collection.bukhari, 1, 1);
  if (hadith != null) {
    print('Hadith 1: ${hadith.hadith}');
  } else {
    print('Hadith not found');
  }

  String collectionURL = hadithService.getCollectionURL(Collection.bukhari);
  print('Collection URL: $collectionURL');

  String hadithURL = hadithService.getHadithURL(Collection.bukhari, 1, 1);
  print('Hadith URL: $hadithURL');

  String bookURL = hadithService.getBookURL(Collection.bukhari, 1);
  print('Book URL: $bookURL');
}
