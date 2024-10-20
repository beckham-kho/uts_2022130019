import 'package:flutter/material.dart';
import 'package:uts_2022130019/model/product_list.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(product.image),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          product.price,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          product.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(36, 41, 62, 1),
                          width: 1
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(1)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(36, 41, 62, 1),
                                width: 1
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(1)),
                            ),
                            child: InkWell(
                              child: const Icon(Icons.remove),
                              onTap: () {},
                            ),
                          ),
                          const Text('0'),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(36, 41, 62, 1),
                                width: 1
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(1)),
                            ),
                            child: InkWell(
                              child: const Icon(Icons.add),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}