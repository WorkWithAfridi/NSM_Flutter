import 'package:flutter/material.dart';

/// ViewModel for managing the application's theme mode.
///
/// This class extends [ValueNotifier] to provide reactive updates
/// when the theme mode changes.
class ThemeViewModel extends ValueNotifier<ThemeMode> {
  /// Initializes the [ThemeViewModel] with the default theme set to light mode.
  ThemeViewModel() : super(ThemeMode.light);

  /// Toggles the theme between light and dark modes.
  ///
  /// If the current theme is [ThemeMode.light], it switches to [ThemeMode.dark],
  /// and vice versa.
  void toggleTheme() {
    value = (value == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
  }
}
