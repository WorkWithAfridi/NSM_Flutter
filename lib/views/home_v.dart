import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart';
import 'package:nsm_flutter/views/auth_v.dart';
import 'package:nsm_flutter/views/counter_v.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppProvider.of(context);
    final authVM = appState.authVM;
    final postsVM = appState.postsVM;
    final themeVM = appState.themeVM;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${authVM.value}!"),
        actions: [
          IconButton(icon: Icon(themeVM.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode), onPressed: themeVM.toggleTheme),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CounterView()));
              },
              child: const Text("Counter App"),
            ),
            ElevatedButton(onPressed: postsVM.fetchPosts, child: const Text("Fetch Posts")),
            const SizedBox(height: 20),

            ValueListenableBuilder<List<String>>(
              valueListenable: postsVM,
              builder: (context, posts, child) {
                if (postsVM.isLoading) {
                  return const CircularProgressIndicator();
                }
                if (postsVM.errorMessage != null) {
                  return Text(postsVM.errorMessage!, style: TextStyle(color: Colors.red));
                }
                return Column(children: posts.map((post) => Text(post, style: TextStyle(fontSize: 18))).toList());
              },
            ),
          ],
        ),
      ),
    );
  }
}
