import 'package:app_aws_recipes/core/middleware/auth_middleware.dart';
import 'package:app_aws_recipes/features/home/bindings/home_binding.dart';
import 'package:app_aws_recipes/features/home/presentation/pages/home_page.dart';
import 'package:app_aws_recipes/features/login/bindings/login_binding.dart';
import 'package:app_aws_recipes/features/login/presentation/pages/login_page.dart';
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
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
