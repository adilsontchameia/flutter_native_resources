import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateProvider = StateProvider<AppLifecycleState>((ref) {
/*
    resumed => from background to foreground
    inactive => app is not focused in not in foreground
    paused => background
    detached => app is detached
*/

  //=> Initial state
  return AppLifecycleState.resumed;
});
