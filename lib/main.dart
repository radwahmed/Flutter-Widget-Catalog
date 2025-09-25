import 'dart:ui';

import 'package:flutter/material.dart';

import 'animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TweenAnimation(),
    );
  }
}

//media query ->  to learn the size of the current view
class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا بناخد معلومات الشاشة كلها
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text("MediaQuery Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Screen width: $width"),
            Text("Screen height: $height"),
            Text("Orientation: $orientation"),
            const SizedBox(height: 20),

            // مستطيل عرضه نص الشاشة
            Container(
              width: width * 0.5,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                "Half Screen Width",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//BackdropFilter -> applies a filter to the existing painted content and then paints child over it
class BackdropFilterDemo extends StatelessWidget {
  const BackdropFilterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
            fit: BoxFit.cover,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // عشان اخلي الشاشة من ورا مزغللة واخلي التركيز علي العناصر اللي عليها
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8.0, // قوة الزغللة X
                  sigmaY: 8.0, // قوة الزغللة Y
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "BackdropFilter with ClipOval",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 3, 74, 17),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //ClipOval -> A widget that clips its child using an oval.
                      ClipOval(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ClipPath -> A widget that clips its child using a path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);

    // منحنيات للموجة
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height - 80, size.width, size.height - 40);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathWaveDemo extends StatelessWidget {
  const ClipPathWaveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: WaveClipper(),
        child: Container(
          height: 300,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1506744038136-46273834b3fb"),
          )),
        ),
      ),
    );
  }
}
