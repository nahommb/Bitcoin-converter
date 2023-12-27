import 'package:flutter/material.dart';
import 'price_screen.dart';

void main()=>runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:price_screen(),
    );
  }
}
