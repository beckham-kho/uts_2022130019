import 'package:flutter/material.dart';
import 'package:uts_2022130019/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController =  TextEditingController();

    return
    Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Profile Settings',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'Email',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Consumer<CartProvider>(
                          builder: (context, user, child) {
                            return Text(
                              user.userEmail,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Color.fromRGBO(36, 41, 62, .5)),
                            hintText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CartProvider>().editPassword(passwordController.text);
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}