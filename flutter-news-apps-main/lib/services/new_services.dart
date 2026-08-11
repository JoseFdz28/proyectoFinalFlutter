
import 'package:flutter/material.dart';
import 'package:flutter_news_apps/models/news_models.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL_NEWS = 'https://newsapi.org/v2';
// ignore: constant_identifier_names
const _APIKEY = '7cf935d590914f0abd4228a9c6a1fffc';


class NewsServices with ChangeNotifier{

  List<Article> headlines = [];
  List<Article> headlinessport = [];
  List<Article> headlineshealth = [];
  NewsServices() {
    getTopHeadlines();
    getTopHeadlinesSport();
    getTopHeadlineshealth();
  }
   Future<void> getTopHeadlines() async {
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlines.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }

    } catch (e) {
      debugPrint('Excepcion al cargar las noticias $e');
    }
  }

  Future<void> getTopHeadlineshealth() async {
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&category=health&apiKey=$_APIKEY');
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlineshealth.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }

    } catch (e) {
      debugPrint('Excepcion al cargar las noticias $e');
    }
  }
   Future<void> getTopHeadlinesSport() async {
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&category=sport&apiKey=$_APIKEY');
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlinessport.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }

    } catch (e) {
      debugPrint('Excepcion al cargar las noticias $e');
    }
  }
}