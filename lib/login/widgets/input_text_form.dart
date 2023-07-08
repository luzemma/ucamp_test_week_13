import 'package:flutter/material.dart';

class InputTextForm extends StatelessWidget {
  const InputTextForm({
    required this.controller,
    required this.labelText,
    this.isObscure,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      obscureText: isObscure ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
