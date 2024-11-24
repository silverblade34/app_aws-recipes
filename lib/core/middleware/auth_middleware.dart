import 'package:app_aws_recipes/config/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();

    bool isLogged = box.read('isLogged') ?? false;
    if (route == Routes.splash) {
      return isLogged ? const RouteSettings(name: Routes.home) : null;
    } else if (route != Routes.login) {
      return isLogged ? null : const RouteSettings(name: Routes.login);
    } else {
      return isLogged
          ? const RouteSettings(name: Routes.home)
          : null;
    }
  }
}
