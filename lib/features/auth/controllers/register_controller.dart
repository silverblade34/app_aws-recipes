import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_aws_recipes/core/widgets/custom_alert.dart';
import 'package:app_aws_recipes/core/widgets/snack_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> signUp() async {
    if (!_validateForm()) return;

    isLoading.value = true;

    try {
      final userAttributes = <AuthUserAttributeKey, String>{
        AuthUserAttributeKey.email: emailController.text.trim(),
        AuthUserAttributeKey.name: nameController.text.trim(),
      };

      final result = await Amplify.Auth.signUp(
        username: emailController.text.trim(),
        password: passwordController.text.trim(),
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      print("--------------------123");
      print(result);
      if (result.isSignUpComplete) {
        SnackHelper.showCustomAlert(
          "Registro exitoso. Ahora puedes iniciar sesión.",
          AlertType.SUCCESS,
        );
        Get.offNamed('/login');
      } else {
        Get.offNamed('/confirmation', arguments: {
          'email': emailController.text.trim(),
        });
      }
    } on AuthException catch (e) {
      final errorMessage = translateSignUpError(e);
      SnackHelper.showCustomAlert(
        errorMessage,
        AlertType.ERROR,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateForm() {
    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      SnackHelper.showCustomAlert(
        'Por favor ingresa un correo válido',
        AlertType.WARNING,
      );
      return false;
    }
    if (nameController.text.isEmpty) {
      SnackHelper.showCustomAlert(
        'El campo nombre no puede estar vacio',
        AlertType.WARNING,
      );
      return false;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      SnackHelper.showCustomAlert(
        'La contraseña debe tener al menos 6 caracteres',
        AlertType.WARNING,
      );
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      SnackHelper.showCustomAlert(
        'Las contraseñas no coinciden',
        AlertType.WARNING,
      );
      return false;
    }
    return true;
  }

  String translateSignUpError(AuthException exception) {
    final errorType = exception.runtimeType.toString();
    final errorMessage = exception.message;

    if (errorType == "UsernameExistsException" ||
        errorMessage.contains("User already exists")) {
      return "Este correo ya está registrado. Intenta iniciar sesión.";
    } else if (errorType == "InvalidPasswordException") {
      if (errorMessage.contains("Password not long enough")) {
        return "La contraseña es demasiado corta. Debe tener al menos 8 caracteres.";
      } else if (errorMessage
          .contains("Password must have uppercase characters")) {
        return "La contraseña debe contener al menos una letra mayúscula.";
      } else if (errorMessage
          .contains("Password must have numeric characters")) {
        return "La contraseña debe contener al menos un número.";
      } else {
        return "La contraseña no cumple con las políticas requeridas. Verifica las condiciones de seguridad.";
      }
    } else if (errorType == "InvalidParameterException") {
      return "Uno o más parámetros son inválidos. Por favor, verifica la información ingresada.";
    } else if (errorType == "CodeMismatchException") {
      return "El código ingresado no es válido. Verifica e inténtalo nuevamente.";
    } else if (errorType == "ExpiredCodeException") {
      return "El código ha expirado. Solicita un nuevo código.";
    } else if (errorType == "TooManyFailedAttempts") {
      return "Demasiados intentos fallidos. Inténtalo de nuevo más tarde.";
    } else if (errorType == "NetworkError") {
      return "Error de red. Por favor, verifica tu conexión a internet.";
    } else {
      return "Error inesperado: $errorMessage";
    }
  }
}
