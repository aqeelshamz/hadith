class CollectionData {
  final String lang;
  final String title;
  final String shortIntro;

  CollectionData({
    required this.lang,
    required this.title,
    required this.shortIntro,
  });

  factory CollectionData.fromJson(Map<String, dynamic> json) {
    return CollectionData(
      lang: json['lang'],
      title: json['title'],
      shortIntro: json['shortIntro'],
    );
  }

  @override
  String toString() {
    return '\n{\n lang: $lang,\n title: $title,\n shortIntro: $shortIntro\n}\n';
  }
}

class HadithCollection {
  // Renamed from Collection
  final String name;
  final bool hasBooks;
  final bool hasChapters;
  final List<CollectionData> collection;
  final int totalHadith;
  final int totalAvailableHadith;

  HadithCollection({
    required this.name,
    required this.hasBooks,
    required this.hasChapters,
    required this.collection,
    required this.totalHadith,
    required this.totalAvailableHadith,
  });

  factory HadithCollection.fromJson(Map<String, dynamic> json) {
    var collectionData = (json['collection'] as List)
        .map((data) => CollectionData.fromJson(data))
        .toList();

    return HadithCollection(
      name: json['name'],
      hasBooks: json['hasBooks'],
      hasChapters: json['hasChapters'],
      collection: collectionData,
      totalHadith: json['totalHadith'],
      totalAvailableHadith: json['totalAvailableHadith'],
    );
  }

  @override
  String toString() {
    return '\n{\n name: $name,\n hasBooks: $hasBooks,\n hasChapters: $hasChapters,\n collection: $collection,\n totalHadith: $totalHadith,\n totalAvailableHadith: $totalAvailableHadith\n}\n';
  }
}

class BookData {
  final String lang;
  final String name;

  BookData({required this.lang, required this.name});

  factory BookData.fromJson(Map<String, dynamic> json) {
    return BookData(lang: json['lang'], name: json['name']);
  }

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

  Book({
    required this.bookNumber,
    required this.book,
    required this.hadithStartNumber,
    required this.hadithEndNumber,
    required this.numberOfHadith,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var bookData =
        (json['book'] as List).map((data) => BookData.fromJson(data)).toList();

    return Book(
      bookNumber: json['bookNumber'],
      book: bookData,
      hadithStartNumber: json['hadithStartNumber'],
      hadithEndNumber: json['hadithEndNumber'],
      numberOfHadith: json['numberOfHadith'],
    );
  }

  @override
  String toString() {
    return '\n{\n bookNumber: $bookNumber,\n book: $book,\n hadithStartNumber: $hadithStartNumber,\n hadithEndNumber: $hadithEndNumber,\n numberOfHadith: $numberOfHadith\n}\n';
  }
}

class Grade {
  final String? gradedBy;
  final String grade;

  Grade({this.gradedBy, required this.grade});

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(gradedBy: json['graded_by'], grade: json['grade']);
  }

  @override
  String toString() {
    return '\n{\n gradedBy: $gradedBy,\n grade: $grade\n}\n';
  }
}

class HadithData {
  final String lang;
  final String chapterNumber;
  final String chapterTitle;
  final int urn;
  final String body;
  final List<Grade> grades;

  HadithData({
    required this.lang,
    required this.chapterNumber,
    required this.chapterTitle,
    required this.urn,
    required this.body,
    required this.grades,
  });

  factory HadithData.fromJson(Map<String, dynamic> json) {
    var gradesFromJson =
        (json['grades'] as List).map((data) => Grade.fromJson(data)).toList();
    return HadithData(
      lang: json['lang'],
      chapterNumber: json['chapterNumber'].toString(), // Ensuring it's a String
      chapterTitle: json['chapterTitle'],
      urn: json['urn'],
      body: json['body'],
      grades: gradesFromJson,
    );
  }

  @override
  String toString() {
    return '\n{\n lang: $lang,\n chapterNumber: $chapterNumber,\n chapterTitle: $chapterTitle,\n urn: $urn,\n body: $body,\n grades: $grades\n}\n';
  }
}

class Hadith {
  final String collection;
  final String bookNumber;
  final String chapterId; // Keeping it as String
  final String hadithNumber;
  final List<HadithData> hadith;

  Hadith({
    required this.collection,
    required this.bookNumber,
    required this.chapterId,
    required this.hadithNumber,
    required this.hadith,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    var hadithList = (json['hadith'] as List)
        .map((data) => HadithData.fromJson(data))
        .toList();

    return Hadith(
      collection: json['collection'],
      bookNumber: json['bookNumber'],
      chapterId: json['chapterId'].toString(),
      hadithNumber: json['hadithNumber'].toString(),
      hadith: hadithList,
    );
  }

  @override
  String toString() {
    return '\n{\n collection: $collection,\n bookNumber: $bookNumber,\n chapterId: $chapterId,\n hadithNumber: $hadithNumber,\n hadith: $hadith\n}\n';
  }
}
