library hadith;

import 'package:hadith/abudawud/books.dart';
import 'package:hadith/abudawud/hadiths.dart';
import 'package:hadith/bukhari/books.dart';
import 'package:hadith/bukhari/hadiths.dart';
import 'package:hadith/classes.dart';
import 'package:hadith/collections.dart';
import 'package:hadith/ibnmajah/books.dart';
import 'package:hadith/ibnmajah/hadiths.dart';
import 'package:hadith/muslim/books.dart';
import 'package:hadith/muslim/hadiths.dart';
import 'package:hadith/nasai/books.dart';
import 'package:hadith/nasai/hadiths.dart';
import 'package:hadith/tirmidhi/books.dart';
import 'package:hadith/tirmidhi/hadiths.dart';

enum Collections {
  bukhari,
  muslim,
  nasai,
  abudawud,
  ibnmajah,
  tirmidhi,
}

enum Languages { en, ar }

_getLanguageIndex(Languages language) {
  switch (language) {
    case Languages.en:
      return 0;
    case Languages.ar:
      return 1;
    default:
      return 0;
  }
}

_getCollectionIndex(Collections collection) {
  switch (collection) {
    case Collections.abudawud:
      return 0;
    case Collections.bukhari:
      return 1;
    case Collections.ibnmajah:
      return 2;
    case Collections.muslim:
      return 3;
    case Collections.nasai:
      return 4;
    case Collections.tirmidhi:
      return 5;
    default:
      return 0;
  }
}

_readBookData(Collections collection) {
  switch (collection) {
    case Collections.abudawud:
      return abudawudBooks;
    case Collections.bukhari:
      return bukhariBooks;
    case Collections.ibnmajah:
      return ibnmajahBooks;
    case Collections.muslim:
      return muslimBooks;
    case Collections.nasai:
      return nasaiBooks;
    case Collections.tirmidhi:
      return tirmidhiBooks;
    default:
      return abudawudBooks;
  }
}

_readHadithData(Collections collection) {
  switch (collection) {
    case Collections.abudawud:
      return abudawudHadiths;
    case Collections.bukhari:
      return bukhariHadiths;
    case Collections.ibnmajah:
      return ibnmajahHadiths;
    case Collections.muslim:
      return muslimHadiths;
    case Collections.nasai:
      return nasaiHadiths;
    case Collections.tirmidhi:
      return tirmidhiHadiths;
    default:
      return abudawudHadiths;
  }
}

/// Returns a list of all hadith collections available.
List<Collection> getCollections() {
  List<Collection> values = [];

  for (var collection in collections) {
    List<CollectionData> collectionData = [];
    for (var data in collection["collection"]) {
      collectionData.add(
        CollectionData(
          lang: data["lang"],
          title: data["title"],
          shortIntro: data["shortIntro"],
        ),
      );
    }
    values.add(
      Collection(
          name: collection["name"],
          hasBooks: collection["hasBooks"],
          hasChapters: collection["hasChapters"],
          collection: collectionData,
          totalHadith: collection["totalHadith"],
          totalAvailableHadith: collection["totalAvailableHadith"]),
    );
  }
  return values;
}

/// Takes [collection] as an argument and returns a [Collection] object.
Collection getCollection(Collections collection) {
  int collectionIndex = _getCollectionIndex(collection);

  List<CollectionData> collectionData = [];
  for (var data in collections[collectionIndex]["collection"]) {
    collectionData.add(
      CollectionData(
        lang: data["lang"],
        title: data["title"],
        shortIntro: data["shortIntro"],
      ),
    );
  }

  var collection0 = collections[collectionIndex];

  return Collection(
      name: collection0["name"],
      hasBooks: collection0["hasBooks"],
      hasChapters: collection0["hasChapters"],
      collection: collectionData,
      totalHadith: collection0["totalHadith"],
      totalAvailableHadith: collection0["totalAvailableHadith"]);
}

/// Takes [collection] and [language] as arguments and returns a [CollectionData] object.
CollectionData getCollectionData(Collections collection, Languages language) {
  int collectionIndex = _getCollectionIndex(collection);
  int langIndex = _getLanguageIndex(language);

  var collectionData = collections[collectionIndex]["collection"][langIndex];

  return CollectionData(
      lang: collectionData["lang"],
      title: collectionData["title"],
      shortIntro: collectionData["shortIntro"]);
}

/// Takes [collection] as an argument and returns a list of [Book] objects.
List<Book> getBooks(Collections collection) {
  List<Book> values = [];
  List books = _readBookData(collection);

  for (var book in books) {
    List<BookData> bookData = [];
    for (var data in book["book"]) {
      bookData.add(
        BookData(
          lang: data["lang"],
          name: data["name"],
        ),
      );
    }
    values.add(
      Book(
          bookNumber: book["bookNumber"],
          book: bookData,
          hadithStartNumber: book["hadithStartNumber"],
          hadithEndNumber: book["hadithEndNumber"],
          numberOfHadith: book["numberOfHadith"]),
    );
  }
  return values;
}

/// Takes [collection] and [bookNumber] as arguments and returns a [Book] object.
Book getBook(Collections collection, int bookNumber) {
  bookNumber = bookNumber - 1;
  List books = _readBookData(collection);

  List<BookData> bookData = [];
  for (var data in books[bookNumber]["book"]) {
    bookData.add(
      BookData(
        lang: data["lang"],
        name: data["name"],
      ),
    );
  }

  return Book(
      bookNumber: books[bookNumber]["bookNumber"],
      book: bookData,
      hadithStartNumber: books[bookNumber]["hadithStartNumber"],
      hadithEndNumber: books[bookNumber]["hadithEndNumber"],
      numberOfHadith: books[bookNumber]["numberOfHadith"]);
}

/// Takes [collection], [bookNumber] and [language] as arguments and returns a [BookData] object.
BookData getBookData(
    Collections collection, int bookNumber, Languages language) {
  bookNumber = bookNumber - 1;
  List books = _readBookData(collection);

  int langIndex = _getLanguageIndex(language);

  return BookData(
      lang: books[bookNumber]["book"][langIndex]["lang"],
      name: books[bookNumber]["book"][langIndex]["name"]);
}

/// Takes [collection] and [bookNumber] as arguments and returns a list of [Hadith] objects.
List<Hadith> getHadiths(Collections collection, int bookNumber) {
  Map hadiths = _readHadithData(collection);

  List<Hadith> values = [];
  for (var hadith in hadiths[bookNumber.toString()]!) {
    List<HadithData> hadithData = [];
    for (var data in hadith["hadith"]) {
      hadithData.add(
        HadithData(
          lang: data["lang"],
          chapterNumber: data["chapterNumber"],
          chapterTitle: data["chapterTitle"],
          urn: data["urn"],
          body: data["body"],
          grades: data["grades"],
        ),
      );
    }
    values.add(
      Hadith(
          collection: hadith["collection"],
          bookNumber: hadith["bookNumber"],
          chapterId: hadith["chapterId"],
          hadithNumber: hadith["hadithNumber"],
          hadith: hadithData),
    );
  }
  return values;
}

/// Takes [collection], [bookNumber] and [hadithNumber] as arguments and returns a [Hadith] object.
Hadith getHadith(Collections collection, int bookNumber, int hadithNumber) {
  hadithNumber = hadithNumber - 1;
  var hadiths =
      _readHadithData(collection)[bookNumber.toString()]![hadithNumber];
  List<HadithData> hadithData = [];
  for (var data in hadiths["hadith"]) {
    hadithData.add(
      HadithData(
        lang: data["lang"],
        chapterNumber: data["chapterNumber"],
        chapterTitle: data["chapterTitle"],
        urn: data["urn"],
        body: data["body"],
        grades: data["grades"],
      ),
    );
  }
  return Hadith(
      collection: hadiths["collection"],
      bookNumber: hadiths["bookNumber"],
      chapterId: hadiths["chapterId"],
      hadithNumber: hadiths["hadithNumber"],
      hadith: hadithData);
}

/// Takes [collection] and [hadithNumber] as arguments and returns a [Hadith] object.
Hadith? getHadithByNumber(Collections collection, String hadithNumber) {
  Map hadiths = _readHadithData(collection);

  for (int i = 1; i <= getBooks(collection).length; i++) {
    if (!hadiths.keys.toList().contains(i.toString())) {
      continue;
    }
    for (var hadith in hadiths[i.toString()]) {
      if (hadith["hadithNumber"] == hadithNumber.toString()) {
        List<HadithData> hadithData = [];
        for (var data in hadith["hadith"]) {
          hadithData.add(
            HadithData(
              lang: data["lang"],
              chapterNumber: data["chapterNumber"],
              chapterTitle: data["chapterTitle"],
              urn: data["urn"],
              body: data["body"],
              grades: data["grades"],
            ),
          );
        }
        return Hadith(
            collection: hadith["collection"],
            bookNumber: hadith["bookNumber"],
            chapterId: hadith["chapterId"],
            hadithNumber: hadith["hadithNumber"],
            hadith: hadithData);
      }
    }
  }

  return null;
}

/// Takes [collection], [bookNumber], [hadithNumber] and [language] as arguments and returns a [HadithData] object.
HadithData getHadithData(Collections collection, int bookNumber,
    int hadithNumber, Languages language) {
  int langIndex = _getLanguageIndex(language);

  var hadith =
      getHadith(collection, bookNumber, hadithNumber).hadith[langIndex];
  return HadithData(
      lang: hadith.lang,
      chapterNumber: hadith.chapterNumber,
      chapterTitle: hadith.chapterTitle,
      urn: hadith.urn,
      body: hadith.body,
      grades: hadith.grades);
}

/// Takes [collection], [hadithNumber] and [language] as arguments and returns a [HadithData] object.
HadithData getHadithDataByNumber(
    Collections collection, String hadithNumber, Languages language) {
  int langIndex = _getLanguageIndex(language);

  Hadith? hadith = getHadithByNumber(collection, hadithNumber);
  if (hadith == null) {
    return HadithData(
        lang: "",
        chapterNumber: "",
        chapterTitle: "",
        urn: 0,
        body: "",
        grades: []);
  }
  return HadithData(
      lang: hadith.hadith[langIndex].lang,
      chapterNumber: hadith.hadith[langIndex].chapterNumber,
      chapterTitle: hadith.hadith[langIndex].chapterTitle,
      urn: hadith.hadith[langIndex].urn,
      body: hadith.hadith[langIndex].body,
      grades: hadith.hadith[langIndex].grades);
}

/// Takes [collection] as argument and returns the URL (from sunnah.com) of that collection
String getCollectionURL(Collections collection) {
  switch (collection) {
    case Collections.abudawud:
      return "https://sunnah.com/abudawud";
    case Collections.bukhari:
      return "https://sunnah.com/bukhari";
    case Collections.ibnmajah:
      return "https://sunnah.com/ibnmajah";
    case Collections.muslim:
      return "https://sunnah.com/muslim";
    case Collections.nasai:
      return "https://sunnah.com/nasai";
    case Collections.tirmidhi:
      return "https://sunnah.com/tirmidhi";
    default:
      return "https://sunnah.com";
  }
}

/// Takes [collection] and [bookNumber] as arguments and returns the URL (from sunnah.com) of that book
String getBookURL(Collections collection, int bookNumber) {
  return "${getCollectionURL(collection)}/$bookNumber";
}

void main() {
  print(getCollections());
}
