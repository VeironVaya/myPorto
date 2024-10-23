import 'package:flutter/material.dart';

class DialogBoxButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Use final

  const DialogBoxButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.black,
      child: Text(
        text,
        style: const TextStyle(color: Colors.orange),
      ),
    );
  }
}
