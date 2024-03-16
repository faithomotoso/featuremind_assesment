import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaffoldMessengerKeyProvider =
    Provider((ref) => GlobalKey<ScaffoldMessengerState>());

void showSnackbar({required WidgetRef ref, required SnackBar snackBar}) {
  ref.read(scaffoldMessengerKeyProvider).currentState?.showSnackBar(snackBar);
}

void showErrorSnackbar({required WidgetRef ref, required String errorMessage}) {
  ref.read(scaffoldMessengerKeyProvider).currentState?.showSnackBar(SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ));
}
