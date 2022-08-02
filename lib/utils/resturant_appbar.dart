import 'package:flutter/material.dart';

class ResturantAppBar extends StatelessWidget {
  const ResturantAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          "https://www.siemreap.net/wp-content/uploads/2018/07/Charcoal-Khmer-Food.jpg",
          fit: BoxFit.cover,
        ),
      ),
      leading: GestureDetector(
        onTap: () { 
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.share),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
