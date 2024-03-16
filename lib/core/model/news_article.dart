import 'package:featuremind_assessment/core/model/news_source.dart';

class NewsArticle {
  late final NewsSource? newsSource;
  late final String? author;
  late final String? title;
  late final String? description;
  late final String? url;
  late final String? urlToImage;
  late final DateTime? publishedAt;
  late final String? content;

  NewsArticle.fromJson({required Map<String, dynamic> json}) {
    if (json.containsKey("source")) {
      newsSource = NewsSource.fromJson(json: json["source"]);
    }

    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = DateTime.tryParse(json["publishedAt"] ?? "");
    content = json["content"];
  }
}