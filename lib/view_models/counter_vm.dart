import 'package:flutter/material.dart';

class CounterViewModel extends ValueNotifier<int> {
  CounterViewModel() : super(0);

  void increment() => value++;
  void decrement() => value--;
}
