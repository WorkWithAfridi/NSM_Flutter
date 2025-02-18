import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart';
import 'package:nsm_flutter/views/home_v.dart';

/// A stateless widget that represents the authentication screen.
/// It allows users to enter their username and log in.
class AuthView extends StatelessWidget {
  // Controller for the username input field
  final TextEditingController usernameController = TextEditingController();

  /// Constructor for [AuthView]. Accepts an optional key for the widget.
  AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetches the [authVM] (authentication view model) from the provider
    final authVM = AppProvider.of(context).authVM;

    return Scaffold(
      appBar: AppBar(title: const Text("Auth")), // App bar with title
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username input field
              TextField(controller: usernameController, decoration: InputDecoration(labelText: "Enter Username")),
              const SizedBox(height: 20),

              // ValueListenableBuilder to reactively update the UI based on auth state
              ValueListenableBuilder<String?>(
                valueListenable: authVM,
                builder: (context, authToken, child) {
                  // Show loading indicator while authentication is in progress
                  if (authVM.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  return ElevatedButton(
                    onPressed: () async {
                      // Checks if the username field is not empty
                      if (usernameController.text.trim() != "") {
                        // Attempts to log in using the entered username
                        await authVM.login(usernameController.text);

                        // If login is successful, navigate to the home view
                        if (authVM.value != null) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
                        }
                      } else {
                        // Displays an error message if the username is empty
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter a username")));
                      }
                    },
                    child: const Text("Login"), // Button text
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
