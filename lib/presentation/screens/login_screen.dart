import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/home'); //Navega al Home despues del login
              }, 
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                context.go('/signup'); //Navega a la pantalla de registro
              },
              child: const Text('¿No tienes cuenta? Registrate'),
            ),
          ]
        ),
      ),
    );
  }
}