import 'package:hadith/hadith.dart';

void main() {
  // Get available collections
  print(getCollections());

  // Get a single collection
  print(getCollection(Collections.bukhari));

  // Get collection data
  print(getCollectionData(Collections.bukhari, Languages.en));

  // Get books of a collection
  print(getBooks(Collections.bukhari));

  // Get a single book
  print(getBook(Collections.bukhari, 1));

  // Get book data
  print(getBookData(Collections.bukhari, 1, Languages.en));

  // Get hadiths of a book
  print(getHadiths(Collections.bukhari, 1));

  // Get a single hadith
  print(getHadith(Collections.bukhari, 1, 1));

  // Get hadith data
  print(getHadithData(Collections.bukhari, 1, 1, Languages.en));

  // Get hadith data by hadith number
  print(getHadithDataByNumber(Collections.bukhari, '1', Languages.en));
  print(getHadithDataByNumber(Collections.muslim, '36 b', Languages.en));

  // Get collection URL
  print(getCollectionURL(Collections.bukhari));

  // Get book URL
  print(getBookURL(Collections.bukhari, 1));
}
