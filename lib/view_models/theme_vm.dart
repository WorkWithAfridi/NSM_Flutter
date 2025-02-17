import 'package:flutter/material.dart';

class ThemeViewModel extends ValueNotifier<ThemeMode> {
  ThemeViewModel() : super(ThemeMode.light);

  void toggleTheme() {
    value = (value == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
  }
}
