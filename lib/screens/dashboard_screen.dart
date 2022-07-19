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
    // final ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginAppBar(
              title: 'Explore products',
              onPress: () {
                authController.logout();
              },
              icon: Icons.logout_outlined,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (index, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("data ${snapshot.error}");
                    }
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Image.network('${data['photo']}'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'Category: ${data['category']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Price: \$${data['price']}'),
                                          const Spacer(),
                                          Text('Total: \$${data['amount']}'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Discount: % ${data['discount']}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return const SizedBox();
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProduct()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
