import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final TextEditingController inputController;
  final String errorMessage;

  const InputField({
    required this.inputController,
    required this.hintText,
    required this.icon,
    required this.textInputType,
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 211, 211, 211),
        ));

    return TextFormField(
      validator: (inputController) {
        if (inputController == null || inputController.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: inputController,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 0.808),
        prefixIcon: SizedBox(
          width: 24.0,
          child: Center(
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        border: outlineBorder,
        focusedBorder: outlineBorder,
        enabledBorder: outlineBorder,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        // focusColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
