import 'package:dio/dio.dart';
import 'package:featuremind_assessment/core/business_logic/providers/keys_provider.dart';
import 'package:featuremind_assessment/core/model/api_keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsDioProvider = FutureProvider<Dio>((ref) async {

  final ApiKeys apiKey = await ref.read(keysProvider.future);

  final dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/v2",
      queryParameters: {
        "apiKey": apiKey.newsApiKey
      },
  ));

  return dio;
});