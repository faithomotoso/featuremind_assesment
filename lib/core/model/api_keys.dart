class ApiKeys {
  late String? newsApiKey;

  ApiKeys.fromJson({required Map<String, dynamic> json}) {
    newsApiKey = json["news_api_key"];
  }
}