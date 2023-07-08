// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:test_week_13/home/home_page.dart';
import 'package:test_week_13/login/widgets/custom_button.dart';
import 'package:test_week_13/login/widgets/input_text_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputTextForm(
                    controller: _userController,
                    labelText: 'Ingresa tu usuario',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputTextForm(
                    controller: _passwordController,
                    labelText: 'Ingresa tu password',
                    isObscure: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Ingresar',
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (validateCredentials()) {
                          scaffold.showSnackBar(
                            const SnackBar(
                              content: Text('Credenciales correctas'),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                username: _userController.text,
                              ),
                            ),
                          );
                        } else {
                          scaffold.showSnackBar(
                            const SnackBar(
                              content: Text('Credenciales incorrectas'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButton(
                    title: 'Salir',
                    color: Colors.orange,
                    onPressed: () => debugPrint('Salir'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateCredentials() {
    final user = _userController.text;
    final password = _passwordController.text;
    return user == 'admin' && password == '12345';
  }
}
