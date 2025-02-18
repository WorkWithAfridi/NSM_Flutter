import 'package:flutter/material.dart';
import 'package:nsm_flutter/view_models/auth_vm.dart'; // Manages user authentication state
import 'package:nsm_flutter/view_models/posts_vm.dart'; // Handles API calls for fetching posts

import '../view_models/counter_vm.dart'; // Handles counter logic
import '../view_models/theme_vm.dart'; // Manages theme settings

/// Centralized application state that holds instances of all ViewModels.
///
/// This class extends [ChangeNotifier] to notify listeners when state changes.
class AppState extends ChangeNotifier {
  /// Manages counter state and logic
  final CounterViewModel counterVM = CounterViewModel();

  /// Manages theme settings (light/dark mode)
  final ThemeViewModel themeVM = ThemeViewModel();

  /// Manages user authentication (login/logout)
  final AuthViewModel authVM = AuthViewModel();

  /// Handles API calls and post data management
  final PostsViewModel postsVM = PostsViewModel();
}
