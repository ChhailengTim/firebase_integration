import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.purple,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "Login to your account",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 25),
        ),
      ],
    );
  }
}
