import 'package:flutter/material.dart';

/// ViewModel for managing a simple counter state.
///
/// This class extends [ValueNotifier] to provide reactive state updates
/// when the counter value changes.
class CounterViewModel extends ValueNotifier<int> {
  /// Initializes the [CounterViewModel] with a default count of 0.
  CounterViewModel() : super(0);

  /// Increments the counter value by 1 and notifies listeners.
  void increment() => value++;

  /// Decrements the counter value by 1 and notifies listeners.
  void decrement() => value--;
}
