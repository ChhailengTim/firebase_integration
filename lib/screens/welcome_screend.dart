import 'package:firebase_integration/screens/dashboard_screen.dart';
import 'package:firebase_integration/screens/login_screen.dart';
import 'package:firebase_integration/utils/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('images/welcome.png'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Welcome to Stock!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                    "Connect to the goods or merchandise kept on the premises of a shop or warehouse and available for sale or distribution."),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  text: "Login",
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()));
                  },
                  text: "Get started",
                  borderColor: Colors.purple[100],
                  fillColor: Colors.transparent,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
