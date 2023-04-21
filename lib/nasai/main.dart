import 'dart:convert';
import 'dart:io';

import 'package:hadith/nasai/books.dart';
import 'package:http/http.dart' as http;

void main() async {
  Map<String, List> hadiths = {};
  for (int i = 1; i <= nasaiBooks.length; i++) {
    print("Book $i");
    Map<String, String> headers = {
      'X-API-KEY': 'SqD712P3E82xnwOAEOkGd5JZH8s9wRR24TqNFzjk',
    };
    String? url =
        'https://api.sunnah.com/v1/collections/nasai/books/$i/hadiths?limit=500';
    while (url != null) {
      var response = await http.get(Uri.parse(url), headers: headers);
      var data = jsonDecode(response.body);
      if (data["data"] != null && data["data"].length != null) {
        print(data["data"].length);
        if (hadiths[i.toString()] != null) {
          hadiths[i.toString()]!.addAll(data["data"]);
        } else {
          hadiths[i.toString()] = data["data"];
        }
      }
      if (data["next"] != null) {
        url =
            'https://api.sunnah.com/v1/collections/nasai/books/$i/hadiths?limit=500&page=${data["next"]}';
      } else {
        url = null;
      }
    }
    File file = File('hadiths.dart');
    file.writeAsStringSync(
        "Map<String, List> nasaiHadiths = ${json.encode(hadiths)};");
  }
}

//previous size: 11.6MB, current: ?
