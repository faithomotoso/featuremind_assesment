class NewsSource {
  late final String? id;
  late final String? name;

  NewsSource.fromJson({required Map<String, dynamic> json}) {
    id = json["id"];
    name = json["name"];
  }
}