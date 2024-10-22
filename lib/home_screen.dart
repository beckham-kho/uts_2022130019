import 'package:flutter/material.dart';
import 'package:uts_2022130019/cart_screen.dart';
import 'package:uts_2022130019/model/product_list.dart';
import 'package:uts_2022130019/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  }
class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _productList = productList;
  List<Product> _foundProduct = [];
  
  @override
  void initState() {
    _foundProduct = _productList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if(enteredKeyword.isEmpty) {
      results = _productList;
    } else {
      results = _productList.where((product) => product.title.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundProduct = results;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromRGBO(244, 245, 252, 1)),
        backgroundColor: const Color.fromRGBO(36, 41, 62, 1),
        title: const Text(''),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(2),
            width: 200,
            height: 40,
            child: TextField(
              style: const TextStyle(color: Color.fromRGBO(244, 245, 252, 1)),
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Color.fromRGBO(244, 245, 252, .6)),
                labelStyle: TextStyle(color: Color.fromRGBO(244, 245, 252, .6)),
                suffixIconColor: Color.fromRGBO(244, 245, 252, 1),
                hintText: 'Search Product',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(36, 41, 62, 1),
              ),
              child: Text(
                'Nekoshop',
                style: TextStyle(
                  color: Color.fromRGBO(244, 245, 252, 1),
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text('Profile'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //   builder: (context) => const SettingScreen(),
                //   )
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_rounded),
              title: const Text('Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                  )
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Our Products',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: InkWell(
                          splashColor: const Color.fromRGBO(142, 187, 255, 1),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => ProductScreen(product: _foundProduct[index],),
                              )
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image.asset(
                                _foundProduct[index].image,
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  _foundProduct[index].title,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: _foundProduct.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(142, 187, 255, 1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => const CartScreen(),
            )
          );
        },
        tooltip: 'Add Product to Cart',
        child: const Icon(Icons.shopping_cart_rounded,
        color: Color.fromRGBO(244, 245, 252, 1),
        ),
      ),
    );
  }
}