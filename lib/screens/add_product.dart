import 'package:firebase_integration/utils/custom_button.dart';
import 'package:firebase_integration/utils/custom_textformfield.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: const [
              CustomTextFormField(
                label: "Product name",
              ),
              CustomTextFormField(
                label: "Category",
              ),
              CustomTextFormField(
                label: "Price",
              ),
              CustomTextFormField(
                label: "Discount",
              ),
              CustomTextFormField(
                label: "Amount",
              ),
              CustomButton(
                text: "Add product",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
