import 'package:flutter/material.dart';
import 'package:uts_2022130019/home_screen.dart';
import 'package:uts_2022130019/model/user_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController emailController =  TextEditingController();
    TextEditingController passwordController =  TextEditingController();
    UserData user = UserData();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('img/1.png'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      'Welcome to Nekoshop',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Text(
                              'Email',
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your email...'
                              ),
                              validator: (value) {
                                if(value!.isEmpty) {
                                  return 'Please enter your email!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Password',
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your password...'
                              ),
                              validator: (value) {
                                if(value!.isEmpty) {
                                  return 'Please enter your password!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if(emailController.text == user.email && passwordController.text == user.password) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                      )
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Email or password incorrect!')
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(36, 41, 62, 1)),
                              ),
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}