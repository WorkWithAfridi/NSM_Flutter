import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart';
import 'package:nsm_flutter/di/app_state.dart';
import 'package:nsm_flutter/views/auth_v.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppState appState = AppState();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      notifier: appState,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: appState.themeVM,
        builder: (context, themeMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff2B3447))),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            // home: CounterScreen(),
            home: AuthView(),
          );
        },
      ),
    );
  }
}
