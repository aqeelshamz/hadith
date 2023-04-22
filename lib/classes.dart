class CollectionData {
  final String lang;
  final String title;
  final String shortIntro;

  CollectionData(
      {required this.lang, required this.title, required this.shortIntro});

  @override
  String toString() {
    return '\n{\n lang: $lang,\n title: $title,\n shortIntro: $shortIntro\n}\n';
  }
}

class Collection {
  final String name;
  final bool hasBooks;
  final bool hasChapters;
  final List<CollectionData> collection;
  final int totalHadith;
  final int totalAvailableHadith;

  Collection(
      {required this.name,
      required this.hasBooks,
      required this.hasChapters,
      required this.collection,
      required this.totalHadith,
      required this.totalAvailableHadith});

  @override
  String toString() {
    return '\n{\n name: $name,\n hasBooks: $hasBooks,\n hasChapters: $hasChapters,\n collection: $collection,\n totalHadith: $totalHadith,\n totalAvailableHadith: $totalAvailableHadith\n}\n';
  }
}

class BookData {
  final String lang;
  final String name;

  BookData({required this.lang, required this.name});

  @override
  String toString() {
    return '\n{\n lang: $lang,\n name: $name\n}\n';
  }
}

class Book {
  final String bookNumber;
  final List<BookData> book;
  final int hadithStartNumber;
  final int hadithEndNumber;
  final int numberOfHadith;

  Book(
      {required this.bookNumber,
      required this.book,
      required this.hadithStartNumber,
      required this.hadithEndNumber,
      required this.numberOfHadith});

  @override
  String toString() {
    return '\n{\n bookNumber: $bookNumber,\n book: $book,\n hadithStartNumber: $hadithStartNumber,\n hadithEndNumber: $hadithEndNumber,\n numberOfHadith: $numberOfHadith\n}\n';
  }
}

class HadithData {
  final String lang;
  final String chapterNumber;
  final String chapterTitle;
  final int urn;
  final String body;
  final List grades;

  HadithData(
      {required this.lang,
      required this.chapterNumber,
      required this.chapterTitle,
      required this.urn,
      required this.body,
      required this.grades});

  @override
  String toString() {
    return '\n{\n lang: $lang,\n chapterNumber: $chapterNumber,\n chapterTitle: $chapterTitle,\n urn: $urn,\n body: $body,\n grades: $grades\n}\n';
  }
}

class Hadith {
  final String collection;
  final String bookNumber;
  final String chapterId;
  final String hadithNumber;
  final List<HadithData> hadith;

  Hadith(
      {required this.collection,
      required this.bookNumber,
      required this.chapterId,
      required this.hadithNumber,
      required this.hadith});

  @override
  String toString() {
    return '\n{\n collection: $collection,\n bookNumber: $bookNumber,\n chapterId: $chapterId,\n hadithNumber: $hadithNumber,\n hadith: $hadith\n}\n';
  }
}
