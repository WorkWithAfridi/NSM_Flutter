import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart'; // Provides global access to AppState using InheritedNotifier
import 'package:nsm_flutter/di/app_state.dart'; // Holds all the ViewModels for state management
import 'package:nsm_flutter/views/auth_v.dart'; // Initial screen (Login screen)

// Entry point of the Flutter application
void main() {
  runApp(MyApp()); // Runs the app using MyApp widget
}

/// The root widget of the application
/// It sets up state management using [AppProvider] and applies theming
class MyApp extends StatelessWidget {
  // Creates an instance of AppState, which holds all application state
  final AppState appState = AppState();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      notifier: appState, // Provides AppState to the entire widget tree
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: appState.themeVM, // Listens for theme changes
        builder: (context, themeMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Hides the debug banner
            theme: ThemeData(
              useMaterial3: true, // Enables Material 3 UI components
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff2B3447)), // Defines a color scheme
            ),
            darkTheme: ThemeData.dark(), // Defines dark theme
            themeMode: themeMode, // Dynamically switches between light and dark mode
            home: AuthView(), // Sets the initial screen to the authentication view
          );
        },
      ),
    );
  }
}
