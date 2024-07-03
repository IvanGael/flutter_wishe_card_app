
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GreetingCard extends StatelessWidget {
  final String wish;
  final String assetAnimation;
  final Color color;

  const GreetingCard({Key? key, required this.wish, required this.color, required this.assetAnimation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        child: Container(
        width: 320,
        height: 500,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: RiveAnimation.asset(
                assetAnimation
              ),
            ),
            const SizedBox(height: 20),
            Text(
              wish,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ).center(),
          ],
        ),
      ),
      ),
    );
  }
}


extension CenterText on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }
}
