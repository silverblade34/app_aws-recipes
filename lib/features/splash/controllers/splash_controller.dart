// splash_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_aws_recipes/config/routes/pages.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  
  @override
  void onInit() {
    super.onInit();
    
    // Configurar la animación
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    
    // Iniciar la secuencia de transición
    _startTransition();
  }
  
  Future<void> _startTransition() async {
    // Esperar 2 segundos antes de iniciar el fade out
    await Future.delayed(const Duration(seconds: 2));
    
    // Iniciar la animación de fade out
    await animationController.forward();
    
    // Navegar al login con una transición suave
    Get.offAllNamed(
      Routes.login,
    );
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
