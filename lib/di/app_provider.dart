import 'package:flutter/material.dart';

import 'app_state.dart';

class AppProvider extends InheritedNotifier<AppState> {
  const AppProvider({super.key, required super.notifier, required super.child});

  static AppState of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<AppProvider>();
    assert(provider != null, 'No AppProvider found in context');
    return provider!.notifier!;
  }
}
