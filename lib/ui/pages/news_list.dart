import 'package:featuremind_assessment/ui/widgets/news_article_card.dart';
import 'package:flutter/material.dart';

import '../../core/model/news_article.dart';

typedef NewsListArgs = ({String searchQuery, List<NewsArticle> newsArticles});

class NewsList extends StatelessWidget {
  static const String routeName = "/news";

  final NewsListArgs args;

  const NewsList({required this.args, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("News"),
            expandedHeight: 100,
            floating: false,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Text(
                  args.searchQuery,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          switch (args.newsArticles) {
            [] => const SliverFillRemaining(
              hasScrollBody: false,fillOverscroll: false,
                child: Center(
                  child: Text("No news available"),
                ),
              ),
            _ => SliverList.separated(
                separatorBuilder: (c, i) => const SizedBox(
                  height: 10,
                ),
                itemCount: args.newsArticles.length,
                itemBuilder: (ctx, index) =>
                    NewsArticleCard(newsArticle: args.newsArticles[index]),
              )
          },
        ],
      ),
    );
  }
}
