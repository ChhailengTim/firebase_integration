import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_integration/controller/auth_controller.dart';
import 'package:firebase_integration/controller/product_controller.dart';
import 'package:firebase_integration/screens/add_product.dart';
import 'package:firebase_integration/utils/appbar_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final ProductController productController = Get.put(ProductController());
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
                    var allProduct = 0;
                    List<DocumentSnapshot> getProduct;
                    if (snapshot.hasData) {
                      getProduct = snapshot.data!.docs;
                      allProduct = getProduct.length;
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return GridView.builder(
                            itemCount: allProduct,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.orange,
                                    child: Text(
                                      '${getProduct[index]['name']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      });
                    }
                    return const SizedBox();
                  }),
            ),
          ],
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
