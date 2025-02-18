import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart';

/// A stateless widget that represents the counter screen.
/// It allows users to view and modify a counter value using buttons.
class CounterView extends StatelessWidget {
  /// Constructor for [CounterView]. Accepts an optional key for the widget.
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetches the app state from the provider
    final appState = AppProvider.of(context);
    final counterVM = appState.counterVM; // The view model for managing the counter

    return Scaffold(
      appBar: AppBar(title: const Text("Counter")), // App bar with title
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text displaying "Counter Value:"
            const Text("Counter Value:", style: TextStyle(fontSize: 20)),

            // Reactively updates the counter display using ValueListenableBuilder
            ValueListenableBuilder<int>(
              valueListenable: counterVM,
              builder: (context, count, child) {
                return Text(count.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
              },
            ),

            const SizedBox(height: 20), // Spacer between counter and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button to increment the counter
                FloatingActionButton(
                  onPressed: counterVM.increment,
                  child: const Icon(Icons.add), // Add icon
                ),
                const SizedBox(width: 20), // Spacer between the two buttons
                // Button to decrement the counter
                FloatingActionButton(
                  onPressed: counterVM.decrement,
                  child: const Icon(Icons.remove), // Remove icon
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
