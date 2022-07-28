import 'package:flutter/material.dart';

class ResturantInfor extends StatelessWidget {
  const ResturantInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cambodia traditional food",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text("\$ \$, khmer official main food"),
          Row(
            children: const [
              Text("4.5"),
              Icon(
                Icons.star,
                color: Colors.green,
              ),
              Text("200+ Ratings"),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on,
                    color: Colors.green,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Free",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text("Delivery"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.timelapse_sharp,
                    color: Colors.green,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Free",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text("Delivery"),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("TAKE AWAYS"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
