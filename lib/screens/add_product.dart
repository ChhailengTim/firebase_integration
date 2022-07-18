import 'package:firebase_integration/controller/product_controller.dart';
import 'package:firebase_integration/utils/custom_button.dart';
import 'package:firebase_integration/utils/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Adding product"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    onSaved: (value) {
                      productController.proname(value);
                    },
                    controller: productController.proName.value,
                    label: "Product name",
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      productController.procategory(value);
                    },
                    controller: productController.proCategory.value,
                    label: "Category",
                  ),
                  CustomTextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, //cant input text
                    ],
                    onSaved: (value) {
                      productController.proprice(value);
                    },
                    onChanged: (value) {
                      productController.proprice(value);
                      productController.priceCalculator();
                    },
                    controller: productController.proPrice.value,
                    label: "Price",
                  ),
                  CustomTextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, //cant input text
                      LengthLimitingTextInputFormatter(3) //only 3 number
                    ],
                    onSaved: (value) {
                      productController.prodiscout(value);
                    },
                    onChanged: (value) {
                      productController.prodiscout(value);
                      productController.priceCalculator();
                    },
                    controller: productController.proDiscout.value,
                    label: "Discount",
                  ),
                  CustomTextFormField(
                    enable: false,
                    controller: productController.proAmout.value,
                    hintText: 'Total Amount',
                    label: "Amount",
                  ),
                  CustomButton(
                    onTap: () {
                      _formKey.currentState!.save();
                      productController
                          .addProduct()
                          .then((value) => Navigator.pop(context));
                      Get.snackbar('Success', 'Product Add successfully',
                          backgroundColor: Colors.purple);
                    },
                    text: "Add product",
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
