import 'package:flutter/material.dart';

import 'app_state.dart'; // Imports the centralized application state

/// A custom [InheritedNotifier] that provides access to [AppState] throughout the app.
/// This allows widgets to efficiently listen to state changes without using external packages.
class AppProvider extends InheritedNotifier<AppState> {
  /// Creates an [AppProvider] which makes [AppState] available to the widget tree.
  const AppProvider({super.key, required super.notifier, required super.child});

  /// Retrieves the nearest [AppProvider] from the widget tree.
  ///
  /// This method ensures that an [AppProvider] exists in the widget tree and
  /// returns its associated [AppState].
  ///
  /// Throws an assertion error if no [AppProvider] is found.
  static AppState of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<AppProvider>();
    assert(provider != null, 'No AppProvider found in context');
    return provider!.notifier!;
  }
}
