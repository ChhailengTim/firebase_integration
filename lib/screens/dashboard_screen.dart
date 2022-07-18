import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_integration/controller/auth_controller.dart';
import 'package:firebase_integration/screens/add_product.dart';
import 'package:firebase_integration/utils/appbar_login.dart';
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
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (index, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return const Text("data");
                  }),
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
