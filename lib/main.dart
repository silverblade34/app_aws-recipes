import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_aws_recipes/config/amplify/amplifyconfiguration.dart';
import 'package:app_aws_recipes/config/routes/pages.dart';
import 'package:app_aws_recipes/config/themes/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WakelockPlus.enable();
  try {
    await Amplify.addPlugins([AmplifyAuthCognito()]);
    await Amplify.configure(amplifyConfig);
    debugPrint('Amplify configurado correctamente');
  } catch (e) {
    debugPrint('Error al configurar Amplify: $e');
  }

  runApp(GetMaterialApp(
    title: "app-aws-recipes",
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.splash,
    theme: AppTheme.lightTheme,
    getPages: AppPages.pages,
  ));
}
