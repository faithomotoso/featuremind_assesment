import 'package:cached_network_image/cached_network_image.dart';
import 'package:featuremind_assessment/core/model/news_article.dart';
import 'package:featuremind_assessment/ui/widgets/news_webview.dart';
import 'package:flutter/material.dart';

class NewsArticleCard extends StatelessWidget {
  final NewsArticle newsArticle;

  const NewsArticleCard({required this.newsArticle, super.key});

  final Widget brokenImage = const Center(
    child: Icon(Icons.broken_image_outlined),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: newsArticle.url != null
          ? () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  enableDrag: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  builder: (ctx) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                          height: MediaQuery.of(ctx).size.height * 0.8,
                          child: NewsWebview(newsUrl: newsArticle.url!)),
                    );
                  });
            }
          : null,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.maxFinite,
                child: newsArticle.urlToImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: newsArticle.urlToImage!,
                          fit: BoxFit.fill,
                          placeholder: (ctx, str) => const Align(
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator())),
                          errorWidget: (ctx, str, _) => brokenImage,
                        ),
                      )
                    : brokenImage,
              ),
              if (newsArticle.title != null)
                _PadWidget(
                  child: Text(
                    newsArticle.title!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              if (newsArticle.description != null)
                _PadWidget(child: Text(newsArticle.description!))
            ],
          )),
    );
  }
}

class _PadWidget extends StatelessWidget {
  final Widget child;

  const _PadWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: child,
    );
  }
}
