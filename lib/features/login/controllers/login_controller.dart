import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:app_aws_recipes/core/widgets/custom_alert.dart';
import 'package:app_aws_recipes/core/widgets/loading_dialog.dart';
import 'package:app_aws_recipes/core/widgets/snack_helper.dart';
import 'package:app_aws_recipes/features/login/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepository();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obscurePass = RxBool(true);
  final box = GetStorage();

  // Future<String?> getCurrentToken() async {
  //   try {
  //     final tokens = await Amplify.Auth.fetchAuthSession();
  //     final tokenResult = tokens.toJson();

  //     if (tokenResult['userPoolTokens'] != null) {
  //       final userPoolTokens =
  //           tokenResult['userPoolTokens'] as Map<String, dynamic>;

  //       final accessToken = userPoolTokens['accessToken'];
  //       print("Token obtenido: $accessToken");
  //       return accessToken;
  //     }
  //     return null;
  //   } catch (e) {
  //     print('Error al obtener el token: $e');
  //     return null;
  //   }
  // }

  validateCredentials() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        await Amplify.Auth.signOut();
        Get.dialog(
          const LoadingDialog(message: "Cargando...", width: 250),
          barrierDismissible: false,
        );

        final SignInResult result = await Amplify.Auth.signIn(
          username: email.text,
          password: password.text,
        );

        if (result.isSignedIn) {
          // final token = await getCurrentToken();
          // if (token != null) {
          //   // Guardar el token en el storage
          //   box.write("authToken", token);
          // }

          final attributes = await Amplify.Auth.fetchUserAttributes();
          for (var attribute in attributes) {
            if (attribute.userAttributeKey == CognitoUserAttributeKey.name) {
              box.write("nameUser", attribute.value);
            }
          }

          box.write("email", email.text);
          box.write('isLogged', true);

          Get.back();
          Get.offAllNamed("/home");
        } else {
          Get.back();
          SnackHelper.showCustomAlert(
            "Error de autenticación, intente nuevamente",
            AlertType.ERROR,
          );
        }
      } on AuthException catch (e) {
        Get.back();
        final translatedError = translateAuthError(e.message);
        SnackHelper.showCustomAlert(translatedError, AlertType.ERROR);
      }
    } else {
      SnackHelper.showCustomAlert(
        "Debe rellenar los campos necesarios",
        AlertType.WARNING,
      );
    }
  }

  String translateAuthError(String errorMessage) {
    if (errorMessage.contains("User does not exist")) {
      return "El usuario no existe. Por favor, regístrese o verifique su nombre de usuario.";
    } else if (errorMessage.contains("Incorrect username or password")) {
      return "El nombre de usuario o la contraseña son incorrectos. Intente nuevamente.";
    } else if (errorMessage.contains("A user is already signed in")) {
      return "Ya hay un usuario autenticado. Por favor, cierre la sesión antes de intentar nuevamente.";
    } else if (errorMessage.contains("NotAuthorizedException")) {
      return "No tiene autorización para realizar esta acción.";
    } else if (errorMessage.contains("User is not confirmed")) {
      return "El usuario no está confirmado. Verifique su correo electrónico.";
    } else if (errorMessage.contains("Password reset required")) {
      return "Debe restablecer su contraseña antes de iniciar sesión.";
    } else {
      return "Ocurrió un error inesperado. Por favor, intente nuevamente.";
    }
  }
}
