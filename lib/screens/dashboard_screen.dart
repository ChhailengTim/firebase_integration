import 'package:firebase_integration/controller/auth_controller.dart';
import 'package:firebase_integration/utils/appbar_login.dart';
import 'package:firebase_integration/utils/custom_button.dart';
import 'package:firebase_integration/utils/product_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginAppBar(
                title: 'Explore products',
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ProductTest(),
                    ProductTest(),
                    ProductTest(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ProductTest(),
                    ProductTest(),
                    ProductTest(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ProductTest(),
                    ProductTest(),
                    ProductTest(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ProductTest(),
                    ProductTest(),
                    ProductTest(),
                  ],
                ),
              ),
              CustomButton(
                onTap: () {
                  authController.logout();
                },
                text: "LogOut",
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
