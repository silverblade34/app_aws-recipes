import 'package:app_aws_recipes/features/auth/controllers/confirmation_controller.dart';
import 'package:get/get.dart';

class ConfirmationBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ConfirmationController>(() => ConfirmationController());
  }
}