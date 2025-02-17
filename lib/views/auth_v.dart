import 'package:flutter/material.dart';
import 'package:nsm_flutter/di/app_provider.dart';
import 'package:nsm_flutter/views/home_v.dart';

class AuthView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();

  AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = AppProvider.of(context).authVM;

    return Scaffold(
      appBar: AppBar(title: const Text("Auth")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: usernameController, decoration: InputDecoration(labelText: "Enter Username")),
              const SizedBox(height: 20),

              ValueListenableBuilder<String?>(
                valueListenable: authVM,
                builder: (context, authToken, child) {
                  if (authVM.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      if (usernameController.text.trim() != "") {
                        await authVM.login(usernameController.text);
                        if (authVM.value != null) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter a username")));
                      }
                    },
                    child: const Text("Login"),
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
