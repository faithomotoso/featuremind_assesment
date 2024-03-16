import 'dart:convert';
import 'dart:developer';

import 'package:featuremind_assessment/core/model/api_keys.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keysProvider = FutureProvider.autoDispose<ApiKeys>((ref) async {
  String rawJson = await rootBundle.loadString("assets/keys/secrets.json");
  log("Loaded secrets.json: $rawJson");

  return ApiKeys.fromJson(json: jsonDecode(rawJson));
});
