import 'package:flutter/material.dart';

class AuthViewModel extends ValueNotifier<String?> {
  AuthViewModel() : super(null); // User starts as "not logged in"

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String username) async {
    _isLoading = true;
    notifyListeners(); // Notify UI to show loading state

    value = null; // Reset state
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    value = username; // Store logged-in user

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    value = null; // Clear user session
  }
}
