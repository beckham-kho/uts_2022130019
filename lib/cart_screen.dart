import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130019/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, counter, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height-100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:  MediaQuery.sizeOf(context).height-300,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          final cart = counter.cartProducts[index];
                          int subtotal = cart.price*cart.totalItem;
                          return ListTile(
                            leading: 
                            SizedBox(
                              width: 100,
                              child: Image.asset(cart.image),
                            ),
                            trailing: Text(
                              'Rp. ${subtotal.toString()}',
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            title: Text(cart.title),
                            subtitle: Text('Rp.${cart.price} x ${cart.totalItem}'),
                          );
                        },
                        itemCount: counter.cartProducts.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Rp. ${counter.checkoutTotalPrice}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll( Color.fromRGBO(142, 187, 255, 1),),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Checkout successfully!')
                                ),
                              );
                            },
                            child: const Text(
                              'Checkout',
                              style: TextStyle(
                                color: Color.fromRGBO(244, 245, 252, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}