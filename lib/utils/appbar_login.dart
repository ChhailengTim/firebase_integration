import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  final IconData? icon;
  const LoginAppBar({
    Key? key,
    this.title,
    this.onPress,
    this.icon,
  }) : super(key: key);

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
        const Spacer(),
        IconButton(
          onPressed: onPress,
          icon: Icon(
            icon,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
