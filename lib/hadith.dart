library hadith;

import 'package:hadith/abudawud/books.dart';
import 'package:hadith/bukhari/books.dart';
import 'package:hadith/classes.dart';
import 'package:hadith/collections.dart';
import 'package:hadith/ibnmajah/books.dart';
import 'package:hadith/muslim/books.dart';
import 'package:hadith/nasai/books.dart';
import 'package:hadith/tirmidhi/books.dart';

enum Collections {
  bukhari,
  muslim,
  nasai,
  abudawud,
  ibnmajah,
  tirmidhi,
}

List<Collection> getCollections() {
  List<Collection> values = [];
  for (var collection in collections) {
    values.add(
      Collection(
          name: collection["name"],
          hasBooks: collection["hasBooks"],
          hasChapters: collection["hasChapters"],
          collection: collection["collection"],
          totalHadith: collection["totalHadith"],
          totalAvailableHadith: collection["totalAvailableHadith"]),
    );
  }
  return values;
}

Collection getCollection(Collections collection) {
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

  return Collection(
      name: collections[index]["name"],
      hasBooks: collections[index]["hasBooks"],
      hasChapters: collections[index]["hasChapters"],
      collection: collections[index]["collection"],
      totalHadith: collections[index]["totalHadith"],
      totalAvailableHadith: collections[index]["totalAvailableHadith"]);
}

List<Book> getBooks(Collections collection) {
  List<Book> values = [];
  List books = [];
  switch (collection) {
    case Collections.abudawud:
      books = abudawudBooks;
      break;
    case Collections.bukhari:
      books = bukhariBooks;
      break;
    case Collections.ibnmajah:
      books = ibnmajahBooks;
      break;
    case Collections.muslim:
      books = muslimBooks;
      break;
    case Collections.nasai:
      books = nasaiBooks;
      break;
    case Collections.tirmidhi:
      books = tirmidhiBooks;
      break;
    default:
      books = abudawudBooks;
      break;
  }
  for (var book in books) {
    values.add(
      Book(
          bookNumber: book["bookNumber"],
          book: book["book"],
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
      books = abudawudBooks;
      break;
    case Collections.bukhari:
      books = bukhariBooks;
      break;
    case Collections.ibnmajah:
      books = ibnmajahBooks;
      break;
    case Collections.muslim:
      books = muslimBooks;
      break;
    case Collections.nasai:
      books = nasaiBooks;
      break;
    case Collections.tirmidhi:
      books = tirmidhiBooks;
      break;
    default:
      books = abudawudBooks;
      break;
  }
  return Book(
      bookNumber: books[bookNumber]["bookNumber"],
      book: books[bookNumber]["book"],
      hadithStartNumber: books[bookNumber]["hadithStartNumber"],
      hadithEndNumber: books[bookNumber]["hadithEndNumber"],
      numberOfHadith: books[bookNumber]["numberOfHadith"]);
}

void main() {
  print(getBook(Collections.bukhari, 1));
}
