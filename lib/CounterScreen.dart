import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tween Animation Builder"),
        centerTitle: true,
      ),
      body: Center(
          child: TweenAnimationBuilder(
              tween: IntTween(begin: 0, end: 100),
              duration: const Duration(seconds: 2),
              builder: ((BuildContext context, int value, child) {
                return Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                );
              }))),
    );
  }
}
