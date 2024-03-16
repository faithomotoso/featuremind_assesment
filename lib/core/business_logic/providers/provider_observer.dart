import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverObserver extends ProviderObserver {

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    log(error.toString());
  }
}