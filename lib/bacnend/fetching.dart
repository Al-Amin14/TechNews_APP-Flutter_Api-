import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_news_app/components/Search_bar.dart';
import 'package:tech_news_app/utils/keys.dart';

Future<List> fetchingNews() async {
  final reponse = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=' +
          Keys.key +
          '&q=' +
        SerchBar.serchBarState.text));
  Map result = jsonDecode(reponse.body);
  return result['aritcles'];
}
