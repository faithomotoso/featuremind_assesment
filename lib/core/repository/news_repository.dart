import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:featuremind_assessment/core/repository/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/news_article.dart';

final newsRepositoryProvider = FutureProvider.autoDispose
    .family<List<NewsArticle>, String>((ref, searchTerm) async {
  ref.invalidateSelf();

  Dio dio = await ref.read(newsDioProvider.future);
  Response response =
      await dio.get("/everything", queryParameters: {"q": searchTerm});

  // log("Api response ${response.data}");

  return List<NewsArticle>.from(
    response.data["articles"].map(
      (a) => NewsArticle.fromJson(json: a),
    ),
  );
});
