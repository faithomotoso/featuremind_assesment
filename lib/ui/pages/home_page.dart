import 'dart:developer';
import 'package:featuremind_assessment/core/repository/news_repository.dart';
import 'package:featuremind_assessment/ui/pages/news_list.dart';
import 'package:featuremind_assessment/ui/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/business_logic/providers/navigator_key_provider.dart';
import '../../core/business_logic/providers/scaffold_messenger_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  @override
  void dispose() {
    searchController.dispose();
    loadingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: ValueListenableBuilder<bool>(
                  valueListenable: loadingNotifier,
                  builder: (ctx, isLoading, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SearchWidget(
                            textEditingController: searchController,
                            readOnly: isLoading),
                        const SizedBox(
                          height: 10,
                        ),
                        isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  if ((formKey.currentState?.validate()) ??
                                      false) {
                                    // Perform api call
                                    try {
                                      loadingNotifier.value = true;

                                      final news = await ref.read(
                                          newsRepositoryProvider(
                                                  searchController.text)
                                              .future);

                                      loadingNotifier.value = false;

                                      ref
                                          .read(navigatorKeyProvider)
                                          .currentState
                                          ?.pushNamed(NewsList.routeName,
                                              arguments: (
                                            searchQuery: searchController.text,
                                            newsArticles: news
                                          ));
                                    } on Exception catch (e, s) {
                                      log("Error fetching news $e/n$s");
                                      loadingNotifier.value = false;
                                      showErrorSnackbar(
                                          ref: ref,
                                          errorMessage: "An error occurred");
                                    }
                                  }
                                },
                                child: const Text("Search"))
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
