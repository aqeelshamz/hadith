library hadith;

import 'dart:convert';
import 'dart:io';
import 'package:hadith/classes.dart';

enum Collections {
  bukhari,
  muslim,
  nasai,
  abudawud,
  ibnmajah,
  tirmidhi,
}

enum Languages { en, ar }

_readFileData(String fileName) {
  File file = File(fileName);
  String jsonString = file.readAsStringSync();
  var data = jsonDecode(jsonString);
  return data;
}

List<Collection> getCollections() {
  List<Collection> values = [];

  for (var collection in _readFileData("collections.json")) {
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

Collection getCollection(Collections collection) {
  var collections = _readFileData("collections.json");
  int index = 0;
  switch (collection) {
    case Collections.abudawud:
      index = 0;
      break;
    case Collections.bukhari:
      index = 1;
      break;
    case Collections.ibnmajah:
      index = 2;
      break;
    case Collections.muslim:
      index = 3;
      break;
    case Collections.nasai:
      index = 4;
      break;
    case Collections.tirmidhi:
      index = 5;
      break;
    default:
      index = 0;
      break;
  }

  List<CollectionData> collectionData = [];
  for (var data in collections[index]["collection"]) {
    collectionData.add(
      CollectionData(
        lang: data["lang"],
        title: data["title"],
        shortIntro: data["shortIntro"],
      ),
    );
  }

  return Collection(
      name: collections[index]["name"],
      hasBooks: collections[index]["hasBooks"],
      hasChapters: collections[index]["hasChapters"],
      collection: collectionData,
      totalHadith: collections[index]["totalHadith"],
      totalAvailableHadith: collections[index]["totalAvailableHadith"]);
}

CollectionData getCollectionData(Collections collection, Languages language) {
  int index = 0;
  switch (collection) {
    case Collections.abudawud:
      index = 0;
      break;
    case Collections.bukhari:
      index = 1;
      break;
    case Collections.ibnmajah:
      index = 2;
      break;
    case Collections.muslim:
      index = 3;
      break;
    case Collections.nasai:
      index = 4;
      break;
    case Collections.tirmidhi:
      index = 5;
      break;
    default:
      index = 0;
      break;
  }

  int langIndex = 0;
  switch (language) {
    case Languages.en:
      langIndex = 0;
      break;
    case Languages.ar:
      langIndex = 1;
      break;
    default:
      langIndex = 0;
      break;
  }

  var collections = _readFileData("collections.json");

  return CollectionData(
      lang: collections[index]["collection"][langIndex]["lang"],
      title: collections[index]["collection"][langIndex]["title"],
      shortIntro: collections[index]["collection"][langIndex]["shortIntro"]);
}

List<Book> getBooks(Collections collection) {
  List<Book> values = [];
  List books = [];
  switch (collection) {
    case Collections.abudawud:
      books = _readFileData("abudawud/books.json");
      break;
    case Collections.bukhari:
      books = _readFileData("bukhari/books.json");
      break;
    case Collections.ibnmajah:
      books = _readFileData("ibnmajah/books.json");
      break;
    case Collections.muslim:
      books = _readFileData("muslim/books.json");
      break;
    case Collections.nasai:
      books = _readFileData("nasai/books.json");
      break;
    case Collections.tirmidhi:
      books = _readFileData("tirmidhi/books.json");
      break;
    default:
      books = _readFileData("abudawud/books.json");
      break;
  }
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

Book getBook(Collections collection, int bookNumber) {
  List books = [];
  bookNumber = bookNumber - 1;
  switch (collection) {
    case Collections.abudawud:
      books = _readFileData("abudawud/books.json");
      break;
    case Collections.bukhari:
      books = _readFileData("bukhari/books.json");
      break;
    case Collections.ibnmajah:
      books = _readFileData("ibnmajah/books.json");
      break;
    case Collections.muslim:
      books = _readFileData("muslim/books.json");
      break;
    case Collections.nasai:
      books = _readFileData("nasai/books.json");
      break;
    case Collections.tirmidhi:
      books = _readFileData("tirmidhi/books.json");
      break;
    default:
      books = _readFileData("abudawud/books.json");
      break;
  }

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

BookData getBookData(
    Collections collection, int bookNumber, Languages language) {
  List books = [];
  bookNumber = bookNumber - 1;
  switch (collection) {
    case Collections.abudawud:
      books = _readFileData("abudawud/books.json");
      break;
    case Collections.bukhari:
      books = _readFileData("bukhari/books.json");
      break;
    case Collections.ibnmajah:
      books = _readFileData("ibnmajah/books.json");
      break;
    case Collections.muslim:
      books = _readFileData("muslim/books.json");
      break;
    case Collections.nasai:
      books = _readFileData("nasai/books.json");
      break;
    case Collections.tirmidhi:
      books = _readFileData("tirmidhi/books.json");
      break;
    default:
      books = _readFileData("abudawud/books.json");
      break;
  }

  int langIndex = 0;
  switch (language) {
    case Languages.en:
      langIndex = 0;
      break;
    case Languages.ar:
      langIndex = 1;
      break;
    default:
      langIndex = 0;
      break;
  }

  return BookData(
      lang: books[bookNumber]["book"][langIndex]["lang"],
      name: books[bookNumber]["book"][langIndex]["name"]);
}

// class HadithData {
//   final String lang;
//   final String chapterNumber;
//   final String chapterTitle;
//   final int urn;
//   final String body;
//   final List grades;

//   HadithData(
//       {required this.lang,
//       required this.chapterNumber,
//       required this.chapterTitle,
//       required this.urn,
//       required this.body,
//       required this.grades});

//   @override
//   String toString() {
//     return '\n{\n lang: $lang,\n chapterNumber: $chapterNumber,\n chapterTitle: $chapterTitle,\n urn: $urn,\n body: $body,\n grades: $grades\n}\n';
//   }
// }

// class Hadith {
//   final String collection;
//   final String bookNumber;
//   final String chapterId;
//   final String hadithNumber;
//   final List<HadithData> hadith;

//   Hadith(
//       {required this.collection,
//       required this.bookNumber,
//       required this.chapterId,
//       required this.hadithNumber,
//       required this.hadith});

//   @override
//   String toString() {
//     return '\n{\n collection: $collection,\n bookNumber: $bookNumber,\n chapterId: $chapterId,\n hadithNumber: $hadithNumber,\n hadith: $hadith\n}\n';
//   }
// }

List<Hadith> getHadiths(Collections collection, int bookNumber) {
  Map<String, List> hadiths = {"0": []};
  switch (collection) {
    case Collections.abudawud:
      hadiths = _readFileData("abudawud/hadiths.json");
      break;
    case Collections.bukhari:
      hadiths = _readFileData("bukhari/hadiths.json");
      break;
    case Collections.ibnmajah:
      hadiths = _readFileData("ibnmajah/hadiths.json");
      break;
    case Collections.muslim:
      hadiths = _readFileData("muslim/hadiths.json");
      break;
    case Collections.nasai:
      hadiths = _readFileData("nasai/hadiths.json");
      break;
    case Collections.tirmidhi:
      hadiths = _readFileData("tirmidhi/hadiths.json");
      break;
    default:
      hadiths = _readFileData("abudawud/hadiths.json");
      break;
  }

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

Hadith getHadith(Collections collection, int bookNumber, int hadithNumber) {
  Map<String, List> hadiths = {"0": []};
  hadithNumber = hadithNumber - 1;
  switch (collection) {
    case Collections.abudawud:
      hadiths = _readFileData("abudawud/hadiths.json");
      break;
    case Collections.bukhari:
      hadiths = _readFileData("bukhari/hadiths.json");
      break;
    case Collections.ibnmajah:
      hadiths = _readFileData("ibnmajah/hadiths.json");
      break;
    case Collections.muslim:
      hadiths = _readFileData("muslim/hadiths.json");
      break;
    case Collections.nasai:
      hadiths = _readFileData("nasai/hadiths.json");
      break;
    case Collections.tirmidhi:
      hadiths = _readFileData("tirmidhi/hadiths.json");
      break;
    default:
      hadiths = _readFileData("abudawud/hadiths.json");
      break;
  }

  List<HadithData> hadithData = [];
  for (var data in hadiths[bookNumber.toString()]![hadithNumber]["hadith"]) {
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
      collection: hadiths[bookNumber.toString()]![hadithNumber]["collection"],
      bookNumber: hadiths[bookNumber.toString()]![hadithNumber]["bookNumber"],
      chapterId: hadiths[bookNumber.toString()]![hadithNumber]["chapterId"],
      hadithNumber: hadiths[bookNumber.toString()]![hadithNumber]
          ["hadithNumber"],
      hadith: hadithData);
}

void main() {
  print(getBooks(Collections.bukhari));
}
