import 'package:flutter/material.dart';

/// ViewModel for handling authentication state in a Flutter app.
/// This class extends [ValueNotifier] to provide reactive updates
/// when authentication state changes.
class AuthViewModel extends ValueNotifier<String?> {
  /// Initializes the [AuthViewModel] with a null user, indicating
  /// that the user is not logged in by default.
  AuthViewModel() : super(null);

  // Private variable to track loading state during authentication
  bool _isLoading = false;

  /// Public getter to check if an authentication operation is in progress.
  bool get isLoading => _isLoading;

  /// Simulates a login process with a username.
  ///
  /// This function sets [_isLoading] to `true`, resets the authentication state,
  /// and simulates a network delay of 2 seconds before setting the user as logged in.
  /// After the process, it updates the UI by notifying listeners.
  Future<void> login(String username) async {
    _isLoading = true;
    notifyListeners(); // Notify UI to reflect the loading state

    value = null; // Reset authentication state before login attempt
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    value = username; // Store logged-in user

    _isLoading = false;
    notifyListeners(); // Notify UI that login is complete
  }

  /// Logs out the current user by resetting the authentication state to `null`.
  void logout() {
    value = null; // Clear user session
    notifyListeners(); // Notify UI of logout
  }
}
