import 'package:app_aws_recipes/features/auth/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<RegisterController>(() => RegisterController());
  }
}