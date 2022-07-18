import 'package:firebase_integration/controller/auth_controller.dart';
import 'package:firebase_integration/screens/add_product.dart';
import 'package:firebase_integration/utils/appbar_login.dart';
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
              LoginAppBar(
                title: 'Explore products',
                onPress: () {
                  authController.logout();
                },
                icon: Icons.logout_outlined,
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddProduct()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
