import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationController extends GetxController {
  final String email = Get.arguments.email;
  final codeController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }

  // Confirmar el registro
  Future<void> confirmSignUp() async {
    if (codeController.text.trim().isEmpty) {
      errorMessage.value = 'Por favor ingresa el código';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: codeController.text.trim(),
      );

      if (result.isSignUpComplete) {
        Get.offNamed('/login');
      }
    } on AuthException catch (e) {
      errorMessage.value = _getErrorMessage(e.message);
    } finally {
      isLoading.value = false;
    }
  }

  // Reenviar el código de confirmación
  Future<void> resendCode() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      await Amplify.Auth.resendSignUpCode(username: email);
      Get.snackbar(
        'Código reenviado',
        'Código reenviado exitosamente a $email',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on AuthException catch (e) {
      errorMessage.value = _getErrorMessage(e.message);
    } finally {
      isLoading.value = false;
    }
  }

  String _getErrorMessage(String error) {
    if (error.contains('CodeMismatchException')) {
      return 'Código inválido';
    } else if (error.contains('ExpiredCodeException')) {
      return 'El código ha expirado';
    }
    return 'Error al confirmar el registro. Intenta nuevamente.';
  }
}
