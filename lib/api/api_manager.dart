import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'api_constants.dart';

class ApiManager {
/*
Source Api : https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
News Api   : https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
 */
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    var response = await http.get(url);
    try {
      /// String
      var responseBody = response.body;

      /// json

      var json = jsonDecode(responseBody);

      /// object
      return SourceResponse.fromJson(json);

      /// SourceResponse
    } catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    var response = await http.get(url);
    try {
      /// String
      var responseBody = response.body;

      /// json

      var json = jsonDecode(responseBody);

      /// object
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> searchNews(String query, String language) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {'apiKey': ApiConstants.apiKey, "q": query, "language": language});
    var response = await http.get(url);
    try {
      /// String
      var responseBody = response.body;

      /// json

      var json = jsonDecode(responseBody);

      /// object
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
