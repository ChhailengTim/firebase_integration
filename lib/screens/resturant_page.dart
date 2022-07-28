import 'package:firebase_integration/utils/resturant_appbar.dart';
import 'package:firebase_integration/utils/resturant_infor.dart';
import 'package:flutter/material.dart';

class ResturantPage extends StatefulWidget {
  const ResturantPage({Key? key}) : super(key: key);

  @override
  State<ResturantPage> createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          ResturantAppBar(),
          SliverToBoxAdapter(
            child: ResturantInfor(),
          ),
        ],
      ),
    );
  }
}
