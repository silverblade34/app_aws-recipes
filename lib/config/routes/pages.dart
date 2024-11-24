import 'package:app_aws_recipes/core/middleware/auth_middleware.dart';
import 'package:app_aws_recipes/features/auth/bindings/confirmation_binding.dart';
import 'package:app_aws_recipes/features/auth/bindings/register_binding.dart';
import 'package:app_aws_recipes/features/auth/presentation/pages/confirmation_page.dart';
import 'package:app_aws_recipes/features/auth/presentation/pages/register_page.dart';
import 'package:app_aws_recipes/features/home/bindings/home_binding.dart';
import 'package:app_aws_recipes/features/home/presentation/pages/home_page.dart';
import 'package:app_aws_recipes/features/auth/bindings/login_binding.dart';
import 'package:app_aws_recipes/features/auth/presentation/pages/login_page.dart';
import 'package:app_aws_recipes/features/splash/bindings/splash_binding.dart';
import 'package:app_aws_recipes/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.confirmation,
      page: () => const ConfirmationPage(),
      binding: ConfirmationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
