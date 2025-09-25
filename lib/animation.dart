import 'package:flutter/material.dart';

import 'CounterScreen.dart';

//Animated Foo
class AnimatedFoo extends StatefulWidget {
  const AnimatedFoo({super.key});

  @override
  State<AnimatedFoo> createState() => _AnimatedFooState();
}

class _AnimatedFooState extends State<AnimatedFoo> {
  double _dimention = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Foo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 30),
          _containerWidget(),
          const Spacer(),
          _buttonWidget(),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }

  Widget _containerWidget() {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInBack,
      height: _dimention,
      width: _dimention,
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buttonWidget() {
    return ElevatedButton(
        onPressed: () {
          _dimention = (_dimention == 100) ? 200 : 100;
          setState(() {});
        },
        child: const Text('start Animation'));
  }
}

//Tween Animation
class TweenAnimation extends StatelessWidget {
  const TweenAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tween Animation Builder"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => const CounterScreen())),
          child: const Text("Navigate to Counter screen"),
        ),
      ),
    );
  }
}
