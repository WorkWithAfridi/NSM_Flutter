import 'dart:convert';

import 'package:flutter/material.dart';

class PostsViewModel extends ValueNotifier<List<String>> {
  PostsViewModel() : super([]);

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify UI to show loading state

    try {
      await Future.delayed(Duration(seconds: 2)); // Simulate API delay
      final response = '[{"title": "Post 1"}, {"title": "Post 2"}, {"title": "Post 3"}]'; // Mock JSON API response
      final List posts = json.decode(response);

      value = posts.map((post) => post["title"].toString()).toList();
    } catch (e) {
      _errorMessage = "Failed to load posts";
    }

    _isLoading = false;
    notifyListeners();
  }
}
