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
- **`getCollection(Collection collection)`** - Takes [collection] as an argument and returns a [Collection] object.
- **`getCollectionData(Collections collection, Languages language)`** - Takes [collection] and [language] as arguments and returns a [CollectionData] object.

**Books:\_**

- **`getBooks(Collections collection)`** - Takes [collection] as an argument and returns a list of [Book] objects.
- **`getBook(Collections collection, int bookNumber)`** - Takes [collection] and [bookNumber] as arguments and returns a [Book] object.
- **`getBookData(Collections collection, int bookNumber, Languages language)`** - Takes [collection], [bookNumber] and [language] as arguments and returns a [BookData] object.

**_Hadiths:_**

- **`getHadiths(Collections collection, int bookNumber)`** - Takes [collection] and [bookNumber] as arguments and returns a list of [Hadith] objects.
- **`getHadith(Collections collection, int bookNumber, int hadithNumber)`** - Takes [collection], [bookNumber] and [hadithNumber] as arguments and returns a [Hadith] object.
- **`getHadithByNumber(Collections collection, String hadithNumber)`** - Takes [collection] and [hadithNumber] as arguments and returns a [Hadith] object.
- **`getHadithData(Collections collection, int bookNumber, int hadithNumber, Languages language)`** - Takes [collection], [bookNumber], [hadithNumber] and [language] as arguments and returns a [HadithData] object.
- **`getHadithDataByNumber(Collections collection, String hadithNumber, Languages language)`** - Takes [collection], [hadithNumber] and [language] as arguments and returns a [HadithData] object.

**_URLs:_**

- **`getCollectionURL(Collections collection)`** - Takes [collection] as argument and returns the URL (from sunnah.com) of that collection
- **`getBookURL(Collections collection, int bookNumber)`** - Takes [collection] and [bookNumber] as arguments and returns the URL (from sunnah.com) of that book

**Enums:**

**_Collections:_**

- Bukhari - **`Collections.bukhari`**
- Muslim - **`Collections.muslim`**
- Abu Dawud - **`Collections.abudawud`**
- Tirmidhi - **`Collections.tirmidhi`**
- Nasai - **`Collections.nasai`**
- Ibn Majah - **`Collections.ibnmajah`**

**_Languages:_**

- English - **`Languages.en`**
- Arabic - **`Languages.ar`**

## Example

**Collections:**

_Get available collections:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getCollections());
}
```

_Get a single collection:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getCollection(Collections.bukhari));
}
```

_Get collection data:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getCollectionData(Collections.bukhari, Languages.en));
}
```

**Books:**

_Get books of a collection:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getBooks(Collections.bukhari));
}
```

_Get a single book:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getBook(Collections.bukhari, 1));
}
```

_Get book data:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getBookData(Collections.bukhari, 1, Languages.en));
}
```

**Hadiths:**

_Get hadiths of a book:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getHadiths(Collections.bukhari, 1));
}
```

_Get a single hadith:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getHadith(Collections.bukhari, 1, 1));
}
```

_Get hadith data:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getHadithData(Collections.bukhari, 1, 1, Languages.en));
}
```

_Get hadith data by hadith number:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getHadithDataByNumber(Collections.bukhari, '1', Languages.en));
}
```

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getHadithDataByNumber(Collections.muslim, '36 b', Languages.en));
}
```

**URLs:**

_Get collection URL:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getCollectionURL(Collections.bukhari));
}
```

_Get book URL:_

```dart
import 'package:hadith/hadith.dart';

void main() {
  print(getBookURL(Collections.bukhari, 1));
}
```
