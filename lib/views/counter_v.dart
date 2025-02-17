import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppProvider.of(context);
    final counterVM = appState.counterVM;

    return Scaffold(
      appBar: AppBar(title: const Text("Counter ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter Value:", style: TextStyle(fontSize: 20)),

            ValueListenableBuilder<int>(
              valueListenable: counterVM,
              builder: (context, count, child) {
                return Text(count.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
              },
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: counterVM.increment, child: const Icon(Icons.add)),
                const SizedBox(width: 20),
                FloatingActionButton(onPressed: counterVM.decrement, child: const Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
