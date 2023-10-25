import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_news/components/searchbar.dart';
import 'package:tech_news/pages/home.dart';
import 'package:tech_news/utils/key.dart';

Future<List> fetchnews() async {
  String Category = 'technology';
  if (Home.currentIndex == 1) {
    Category = 'business';
  } else if (Home.currentIndex == 2) {
    Category = 'science';
  } else if (Home.currentIndex == 3) {
    Category = 'sports';
  }
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$Category&pageSize=100&apiKey=${Keys.key}&q=${SearchBar.searchcontroller.text}'),
  );
  Map result = jsonDecode(response.body);
  return (result['articles']);
}
