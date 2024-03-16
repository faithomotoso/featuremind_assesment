import 'package:dio/dio.dart';
import 'package:featuremind_assessment/core/model/news_article.dart';
import 'package:featuremind_assessment/core/repository/dio_provider.dart';
import 'package:featuremind_assessment/core/repository/news_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils.dart';

class MockDio extends Mock implements Dio {}

void main() {
  test(
      "Test news repository provider makes api call with the appropriate search param",
      () async {
    final Dio mockDio = MockDio();

    final ProviderContainer container = createContainer(
        overrides: [newsDioProvider.overrideWith((ref) => mockDio)]);

    when(() => mockDio.get(any<String>(),
        queryParameters:
            any<Map<String, dynamic>>(named: "queryParameters"))).thenAnswer(
        (invocation) async => Response(requestOptions: RequestOptions(), data: {
              "articles": [
                {
                  "source": {"id": "1919", "name": "A source"},
                  "author": "Mr Miyagi",
                  "title": "A title",
                  "description": "A description",
                  "url": "https://www.google.com",
                  "urlToImage": "https://www.google.com",
                }
              ]
            }));

    List<NewsArticle> articles =
        await container.read(newsRepositoryProvider("A query param").future);

    verify(() =>
            mockDio.get(any<String>(), queryParameters: {"q": "A query param"}))
        .called(1);
    expect(articles, isNotEmpty);
  });
}
