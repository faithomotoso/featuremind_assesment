import 'package:featuremind_assessment/core/model/news_article.dart';
import 'package:featuremind_assessment/ui/pages/news_list.dart';
import 'package:featuremind_assessment/core/business_logic/providers/keys_provider.dart';
import 'package:featuremind_assessment/core/business_logic/providers/provider_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/business_logic/providers/navigator_key_provider.dart';
import 'core/business_logic/providers/scaffold_messenger_provider.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(ProviderScope(observers: [RiverObserver()], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pre-load the api keys
    ref.watch(keysProvider);

    return MaterialApp(
      title: 'Feature/Mind',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scaffoldMessengerKey: ref.read(scaffoldMessengerKeyProvider),
      navigatorKey: ref.read(navigatorKeyProvider),
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          "/" || HomePage.routeName => MaterialPageRoute(builder: (ctx) => const HomePage()),
          NewsList.routeName => MaterialPageRoute(builder: (ctx) {
              return NewsList(
                  args: settings.arguments as NewsListArgs);
            }),
          _ => MaterialPageRoute(builder: (ctx) => Container())
        };
      },
    );
  }
}
