import 'package:firebase_integration/utils/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('images/welcome.png'),
          Text(
            "Welcome to Stock!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
          ),
          const Text(
              "Connect to the goods or merchandise kept on the premises of a shop or warehouse and available for sale or distribution."),
          const CustomButton(
            text: "Login",
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const CustomButton(
            text: "Get started",
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
