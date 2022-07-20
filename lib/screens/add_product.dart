import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_integration/controller/product_controller.dart';
import 'package:firebase_integration/utils/custom_button.dart';
import 'package:firebase_integration/utils/custom_textformfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  AddProduct({
    Key? key,
    this.productID,
  }) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? productID;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ProductController productController = Get.put(ProductController());
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed pick image: $e');
    }
  }

  Future uploadImage() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.productID}/photo")
        .child('pro_$postID');

    await ref.putFile(image!);

    //upload to cloudfirestore
    firebaseFirestore
        .collection('products')
        .doc(widget.productID)
        .collection('photo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Add product"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: AddProduct._formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  image != null
                      ? Image.file(image!)
                      : const Text('No image selected'),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
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
                      uploadImage();
                      AddProduct._formKey.currentState!.save();
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
