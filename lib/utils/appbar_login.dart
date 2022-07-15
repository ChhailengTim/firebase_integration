import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  final String? title;
  const LoginAppBar({Key? key, this.title}) : super(key: key);

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
        Text(
          title ?? "add your title",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 25),
        ),
      ],
    );
  }
}
