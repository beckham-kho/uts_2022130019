import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130019/login_screen.dart';
import 'package:uts_2022130019/providers/cart_provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(0),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}