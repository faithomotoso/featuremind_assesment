import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorKeyProvider = Provider((ref) => GlobalKey<NavigatorState>());