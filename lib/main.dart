import 'package:flutter/material.dart';
import 'package:newsapi/widges/views.dart';

void main(){
  runApp(api());
}

class api extends StatelessWidget {
  const api({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "news",
      home: HomeScreen(),
    );
  }
}
