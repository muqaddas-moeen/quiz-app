import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({required this.onTap, required this.text, super.key});

  final String? text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 13, 19, 77),
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 50),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        text!,
        style: const TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}
