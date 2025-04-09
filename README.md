[![pub package](https://img.shields.io/pub/v/hadith.svg)](https://pub.dev/packages/hadith)

This dart plugin provides access to the Hadith data offline.

Available Hadith data:

- Bukhari
- Muslim
- Abu Dawud
- Tirmidhi
- Nasai
- Ibn Majah

Hadith data is taken from sunnah.com.

## Getting Started

To use this plugin, add `hadith` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

**Functions:**

**_Collections:_**

- **`getCollections()`** - Returns a list of Hadith collections available

**Books:\_**

- **`getBooks(Collections collection)`** - Takes [collection] as an argument and returns a list of [Book] objects.
- **`getBook(Collections collection, int bookNumber)`** - Takes [collection] and [bookNumber] as arguments and returns a [Book] object.

**_Hadiths:_**

- **`getHadiths(Collections collection, int bookNumber)`** - Takes [collection] and [bookNumber] as arguments and returns a list of [Hadith] objects.
- **`getHadith(Collections collection, int bookNumber, int hadithNumber)`** - Takes [collection], [bookNumber] and [hadithNumber] as arguments and returns a [Hadith] object.

**_URLs:_**

- **`getCollectionURL(Collections collection)`** - Takes [collection] as argument and returns the URL (from sunnah.com) of that collection
- **`getBookURL(Collections collection, int bookNumber)`** - Takes [collection] and [bookNumber] as arguments and returns the URL (from sunnah.com) of that book
- **`getHadithURL(Collections collection, int bookNumber, int hadithNumber)`** - Takes [collection], [bookNumber] and [hadithNumber] as arguments and returns the URL (from sunnah.com) of that hadith

**Enums:**

**_Collections:_**

- Bukhari - **`Collections.bukhari`**
- Muslim - **`Collections.muslim`**
- Abu Dawud - **`Collections.abudawud`**
- Tirmidhi - **`Collections.tirmidhi`**
- Nasai - **`Collections.nasai`**
- Ibn Majah - **`Collections.ibnmajah`**

## Example

**Collections:**

_Get available collections:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  HadithService hadithService = HadithService();

  List<Collection> collections = await hadithService.getCollections();
  print('Available Collections:' + collections.toString());
}
```

**Books:**

_Get books in a collection:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  List<Book> books = await hadithService.getBooks(Collection.bukhari);
  print('Books for Sahih Bukhari:');
  for (var book in books) {
    print("${books.indexOf(book) + 1}. " + book.book[0].name);
  }
}
```

_Get a single book:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  Book book = await hadithService.getBook(Collection.bukhari, 1);
  print(book);
}
```

**Hadiths:**

_Get hadiths in a book:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  List<Hadith> hadiths = await hadithService.getHadiths(Collection.bukhari, 1);
  print('Hadiths for Sahih Bukhari, Book 1: ${hadiths.length}');
}
```

_Get a single hadith:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  Hadith? hadith = await hadithService.getHadith(Collection.bukhari, 1, 1);
  if (hadith != null) {
    print('Hadith 1: ${hadith.hadith}');
  } else {
    print('Hadith not found');
  }
}
```

**URLs:**

_Get collection URL:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  String collectionURL = hadithService.getCollectionURL(Collection.bukhari);
  print('Collection URL: $collectionURL');
}
```

_Get book URL:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  String bookURL = hadithService.getBookURL(Collection.bukhari, 1);
  print('Book URL: $bookURL');
}
```

_Get hadith URL:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  String hadithURL = hadithService.getHadithURL(Collection.bukhari, 1, 1);
  print('Hadith URL: $hadithURL');
}
```
