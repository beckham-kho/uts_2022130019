import 'package:flutter/material.dart';
import 'package:uts_2022130019/model/cart_product.dart';
import 'package:uts_2022130019/providers/cart_provider.dart';
import 'package:uts_2022130019/model/product_list.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;


  @override
  Widget build(BuildContext context) {
    final existingProductCart = ModalRoute.of(context)!.settings.arguments as CartProduct?;
    final isChangeTotalItem = existingProductCart != null;

    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, counter, child) {
          return SingleChildScrollView(
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
                              'Rp. ${product.price}',
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
                                  onTap: () {counter.value--;},
                                ),
                              ),
                              Text((counter.value).toString()),
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
                                  onTap: () {counter.value++;},
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final newAddedProduct = CartProduct(
                              title: product.title,
                              image: product.image,
                              price: product.price,
                              totalItem: counter.value
                            );
                            if(isChangeTotalItem) {
                              context.read<CartProvider>().editContact(newAddedProduct);
                            } else {
                              context.read<CartProvider>().addProductCart(newAddedProduct);
                            }
                          },
                          child: const Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          );
        },
      )
    );
  }
}