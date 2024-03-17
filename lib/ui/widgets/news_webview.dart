// The API being used doesn't send over the entire news content but has a link for it

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebview extends StatefulWidget {
  final String newsUrl;

  const NewsWebview({required this.newsUrl, super.key});

  @override
  State<NewsWebview> createState() => _NewsWebviewState();
}

class _NewsWebviewState extends State<NewsWebview> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.newsUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: webViewController),
    );
  }
}
