import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

ProviderContainer createContainer({
  List<Override>? overrides,
}) {
  final ProviderContainer container =
      ProviderContainer(overrides: overrides ?? []);

  addTearDown(container.dispose);

  return container;
}
