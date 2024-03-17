import 'dart:convert';
import 'dart:developer';

import 'package:featuremind_assessment/core/model/api_keys.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keysProvider = FutureProvider.autoDispose<ApiKeys?>((ref) async {
  log("Loading secrets json");

  try {
    String rawJson = await rootBundle.loadString("assets/keys/secrets.json");
    log("Loaded secrets.json: $rawJson");

    final KeepAliveLink link = ref.keepAlive();

    return ApiKeys.fromJson(json: jsonDecode(rawJson));
  } catch (e, s) {
    log("Error loading api keys: $e, $s");

    return null;
  }
});
