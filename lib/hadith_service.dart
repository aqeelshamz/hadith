// hadith_service.dart
import 'dart:convert';
import 'dart:io';
import 'classes.dart';
import 'enums.dart';

class HadithService {
  // Caches to store loaded data and prevent re-reading files
  final Map<Collection, List<Book>> _booksCache = {};
  final Map<Collection, Map<String, dynamic>> _hadithsCache = {};

  /// Returns the name of the collection as a string.
  String _getCollectionName(Collection collection) {
    return collection.toString().split('.').last;
  }

  /// Loads books data for the specified collection.
  Future<List<Book>> getBooks(Collection collection) async {
    if (_booksCache.containsKey(collection)) {
      return _booksCache[collection]!;
    }

    String collectionName = _getCollectionName(collection);
    String path = 'data/$collectionName/books.json';
    File file = File(path);

    if (!await file.exists()) {
      throw Exception('Books file not found for $collectionName at $path');
    }

    String contents = await file.readAsString();
    List<dynamic> jsonData = jsonDecode(contents);
    List<Book> books = jsonData.map((json) => Book.fromJson(json)).toList();

    _booksCache[collection] = books;
    return books;
  }

  /// Loads hadiths data for the specified collection.
  Future<Map<String, dynamic>> _loadHadiths(Collection collection) async {
    if (_hadithsCache.containsKey(collection)) {
      return _hadithsCache[collection]!;
    }

    String collectionName = _getCollectionName(collection);
    String path = 'data/$collectionName/hadiths.json';
    File file = File(path);

    if (!await file.exists()) {
      throw Exception('Hadiths file not found for $collectionName at $path');
    }

    String contents = await file.readAsString();
    Map<String, dynamic> jsonData = jsonDecode(contents);

    _hadithsCache[collection] = jsonData;
    return jsonData;
  }

  /// Returns a list of all available collections.
  Future<List<Collection>> getCollections() async {
    // Assuming all collections have corresponding directories and files
    // Alternatively, you can scan the 'data' directory to find available collections
    return Collection.values;
  }

  /// Fetches a specific book by its number from a collection.
  Future<Book> getBook(Collection collection, int bookNumber) async {
    List<Book> books = await getBooks(collection);
    return books.firstWhere(
      (book) => book.bookNumber == bookNumber.toString(),
      orElse: () => throw Exception(
        'Book number $bookNumber not found in $collection.',
      ),
    );
  }

  /// Fetches all hadiths for a specific book in a collection.
  Future<List<Hadith>> getHadiths(
    Collection collection,
    int bookNumber,
  ) async {
    Map<String, dynamic> hadithsData = await _loadHadiths(collection);
    String bookKey = bookNumber.toString();

    if (!hadithsData.containsKey(bookKey)) {
      throw Exception(
        'Hadiths not found for book number $bookNumber in $collection.',
      );
    }

    List<dynamic> hadithList = hadithsData[bookKey];
    return hadithList.map((json) => Hadith.fromJson(json)).toList();
  }

  /// Fetches a specific hadith by book number and hadith number.
  Future<Hadith?> getHadith(
    Collection collection,
    int bookNumber,
    int hadithNumber,
  ) async {
    List<Hadith> hadiths = await getHadiths(collection, bookNumber);
    for (Hadith hadith in hadiths) {
      if (hadith.hadithNumber == hadithNumber.toString()) {
        return hadith;
      }
    }
    return null;
  }

  /// Returns the URL for a specific collection.
  String getCollectionURL(Collection collection) {
    String baseURL = "https://sunnah.com";
    String collectionName = _getCollectionName(collection);
    return "$baseURL/$collectionName";
  }

  /// Returns the URL for a specific book in a collection.
  String getBookURL(Collection collection, int bookNumber) {
    return "${getCollectionURL(collection)}/$bookNumber";
  }

  /// Returns the URL for a specific hadith in a collection.
  String getHadithURL(
    Collection collection,
    int bookNumber,
    int hadithNumber,
  ) {
    return "${getBookURL(collection, bookNumber)}/$hadithNumber";
  }

  /// Takes [collection] and [language] and returns the collection data for that language.
  Future<List<CollectionData>> getCollectionData(
    Collection collection,
    Languages language,
  ) async {
    // Implement this method based on your collections data structure
    // For example, load from a 'collections.json' file
    throw UnimplementedError(
      "Implement this method based on your collections data structure.",
    );
  }
}
