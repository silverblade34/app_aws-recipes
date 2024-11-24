import 'package:app_aws_recipes/config/constants/assets.dart';
import 'package:app_aws_recipes/features/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller.fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: controller.fadeAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tu logo o contenido del splash
                  Image.asset(
                    AppAssets.splashImage, // Asegúrate de tener esta imagen
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
