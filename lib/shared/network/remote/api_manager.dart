import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/NewsResponse.dart';
import '../../../models/SourcesResponse.dart';
import '../../components/constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String cat) async {
    Uri URL = Uri.https(
        BASE, "/v2/top-headlines/sources", {"apiKey": APIKEY, "category": cat});
    http.Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonResponse);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri URL = Uri.https(
        BASE, "/v2/everything", {"apiKey": APIKEY, "sources": sourceId});
    http.Response response = await http.get(URL);
    var json = jsonDecode(response.body);

    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
