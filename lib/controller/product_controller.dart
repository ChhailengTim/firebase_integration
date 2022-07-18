import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_integration/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final proname = ''.obs;
  final procategory = ''.obs;
  final proprice = ''.obs;
  final prodiscout = ''.obs;
  final proamout = ''.obs;

  final proName = TextEditingController().obs;
  final proCategory = TextEditingController().obs;
  final proPrice = TextEditingController().obs;
  final proDiscout = TextEditingController().obs;
  final proAmout = TextEditingController().obs;

  void clearData() {
    proname.value = '';
    proName.value.text = '';
  }

  void priceCalculator() {
    proAmout.value.text = prodiscout.value != '' && proprice.value != ''
        ? double.parse(prodiscout.value) > 100
            ? 'Discount over 100%'
            : '\$ ${((100 - double.parse(prodiscout.value)) / 100) * double.parse(proprice.value)}'
        : '';
    proAmout.refresh();
  }

  Future addProduct() async {
    var item = ProductModel();
    item.name = proname.value;
    item.category = procategory.value;
    item.price = double.tryParse(proprice.value) ?? 0.00;
    item.discount = double.tryParse(prodiscout.value) ?? 0;
    item.amount = item.price! - ((item.price! * item.discount!) / 100);

    await FirebaseFirestore.instance
        .collection('products')
        .add(item.toMap())
        .then((value) {
      clearData();
      FirebaseFirestore.instance
          .collection('products')
          .doc(value.id)
          .update({'id': value.id});
    });
  }
}