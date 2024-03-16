import 'package:featuremind_assessment/core/model/news_article.dart';
import 'package:featuremind_assessment/ui/pages/news_list.dart';
import 'package:featuremind_assessment/ui/widgets/news_article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Test the news list page displays widgets as expected",
      (widgetTester) async {
    List<NewsArticle> articles = [
      NewsArticle(
        title: "Article 1",
        author: "Miyagi",
        description: "A description goes here 1",
        content: "Some content goes here 1",
        urlToImage: "https://www.google.com",
      ),
      NewsArticle(
        title: "Article 2",
        author: "Miyagi 2",
        description: "A description goes here 2",
        content: "Some content goes here 2",
        urlToImage: "https://www.google.com",
      ),
    ];

    NewsListArgs args = (newsArticles: articles, searchQuery: "A search query");
    await widgetTester.pumpWidget(ProviderScope(
        child: MaterialApp(
      home: NewsList(args: args),
    )));

    expect(find.text("News"), findsOneWidget);
    expect(find.text(args.searchQuery), findsOneWidget);
    expect(find.byType(NewsArticleCard), findsAtLeast(1));
  });
  
  testWidgets("Test the text displayed when no news article is available", (widgetTester) async {
    NewsListArgs args = (newsArticles: [], searchQuery: "A search query");
    await widgetTester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: NewsList(args: args),
        )));
    
    expect(find.text("No news available"), findsOneWidget);
  });
}
