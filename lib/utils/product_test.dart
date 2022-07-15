import 'package:flutter/material.dart';

class ProductTest extends StatelessWidget {
  const ProductTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
            'https://media.istockphoto.com/photos/plastic-bottle-of-coca-picture-id537059224?k=20&m=537059224&s=170667a&w=0&h=FD2NoCuJNIw3I5fYG8z0-JB9TFBjJG_3NCVb8l7p4HM=',
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "CocoCola",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Text("\$ 10"),
        ],
      ),
    );
  }
}
