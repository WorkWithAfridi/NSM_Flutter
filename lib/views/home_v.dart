import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart';
import 'package:nsm_flutter/views/auth_v.dart';
import 'package:nsm_flutter/views/counter_v.dart';

/// A stateless widget that represents the home screen.
/// It displays user information, allows navigation to the counter screen,
/// and handles theme toggling and logging out.
class HomeView extends StatelessWidget {
  /// Constructor for [HomeView]. Accepts an optional key for the widget.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetches the app state from the provider
    final appState = AppProvider.of(context);
    final authVM = appState.authVM; // Authentication view model
    final postsVM = appState.postsVM; // Posts view model
    final themeVM = appState.themeVM; // Theme view model

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${authVM.value}!"), // Displays logged-in user's name
        actions: [
          // Icon button to toggle between light and dark themes
          IconButton(
            icon: Icon(themeVM.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
            onPressed: themeVM.toggleTheme, // Toggles theme mode
          ),
          // Icon button for logging out the user
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logs out the user and navigates to the auth screen
              authVM.logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthView()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button to navigate to the CounterView
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CounterView()));
              },
              child: const Text("Counter App"),
            ),
            // Button to fetch posts
            ElevatedButton(onPressed: postsVM.fetchPosts, child: const Text("Fetch Posts")),
            const SizedBox(height: 20),

            // Reactively displays posts or loading/error state
            ValueListenableBuilder<List<String>>(
              valueListenable: postsVM,
              builder: (context, posts, child) {
                // Show loading indicator while fetching posts
                if (postsVM.isLoading) {
                  return const CircularProgressIndicator();
                }

                // Show error message if there was an issue fetching posts
                if (postsVM.errorMessage != null) {
                  return Text(postsVM.errorMessage!, style: TextStyle(color: Colors.red));
                }

                // Display list of posts
                return Column(children: posts.map((post) => Text(post, style: TextStyle(fontSize: 18))).toList());
              },
            ),
          ],
        ),
      ),
    );
  }
}
