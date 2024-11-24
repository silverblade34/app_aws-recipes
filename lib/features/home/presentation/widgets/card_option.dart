import 'package:flutter/material.dart';

class CardOption extends StatelessWidget {
  final String title;
  final Color background;
  final String imagepath;
  final VoidCallback onTap;

  const CardOption({
    super.key,
    required this.title,
    required this.background,
    required this.imagepath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              imagepath,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
