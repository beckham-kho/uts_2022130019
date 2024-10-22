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
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, counter, child) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height-40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Image.asset(product.image),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  color: const Color.fromRGBO(204, 204, 204, 1),
                                  onPressed: () {
                                    counter.value = 1;
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
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
                                  onTap: () {
                                    if(counter.value == 1) {
                                      counter.value == 1;
                                    } else {
                                      counter.value--;
                                    }
                                  },
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
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll( Color.fromRGBO(142, 187, 255, 1),),
                          ),
                          onPressed: () {
                            final newAddedProduct = CartProduct(
                              title: product.title,
                              image: product.image,
                              price: product.price,
                              totalItem: counter.value
                            );
                            
                            context.read<CartProvider>().addProductCart(newAddedProduct);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product added to cart successfully!')
                              ),
                            );
                          },
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Color.fromRGBO(244, 245, 252, 1),
                            ),
                          ),
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