import 'package:featuremind_assessment/core/business_logic/providers/keys_provider.dart';
import 'package:featuremind_assessment/core/model/api_keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

void main() {
  test("Test secrets.json is available and can be loaded", () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final ProviderContainer container = createContainer();

    final ApiKeys apiKeys = await container.read(keysProvider.future);

    expect(apiKeys.newsApiKey, isNotNull);
  });
}