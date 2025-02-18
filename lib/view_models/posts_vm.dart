import 'dart:convert';

import 'package:flutter/material.dart';

/// ViewModel for managing and fetching a list of posts.
///
/// This class extends [ValueNotifier] to provide reactive state updates
/// when the list of posts changes.
class PostsViewModel extends ValueNotifier<List<String>> {
  /// Initializes the [PostsViewModel] with an empty list of posts.
  PostsViewModel() : super([]);

  // Private variables for tracking loading state and errors
  bool _isLoading = false;
  String? _errorMessage;

  /// Indicates whether posts are currently being fetched.
  bool get isLoading => _isLoading;

  /// Holds any error message encountered during fetching.
  String? get errorMessage => _errorMessage;

  /// Simulates fetching posts from an API.
  ///
  /// This function sets [_isLoading] to `true`, clears previous errors,
  /// and simulates a network request with a 2-second delay.
  /// If successful, it parses a mock JSON response and updates the list of posts.
  /// If an error occurs, an error message is set.
  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify UI to reflect loading state

    try {
      await Future.delayed(Duration(seconds: 2)); // Simulate API delay

      // Mock API JSON response
      final response = '[{"title": "Post 1"}, {"title": "Post 2"}, {"title": "Post 3"}]';
      final List<dynamic> posts = json.decode(response);

      // Extract post titles and update the state
      value = posts.map((post) => post["title"].toString()).toList();
    } catch (e) {
      _errorMessage = "Failed to load posts"; // Store error message
    }

    _isLoading = false;
    notifyListeners(); // Notify UI that fetching is complete
  }
}
