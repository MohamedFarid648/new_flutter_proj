import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold is a Statefull Widget
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          TextButton(
            child: const Text("Thank You"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
