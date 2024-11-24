import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_aws_recipes/features/auth/controllers/confirmation_controller.dart';

class ConfirmationPage extends GetView<ConfirmationController> {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Registro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Se ha enviado un código de confirmación a ${controller.email}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: controller.codeController,
                decoration: const InputDecoration(
                  labelText: 'Código de confirmación',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.confirmation_number),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        await controller.confirmSignUp();
                      },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('Confirmar'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        await controller.resendCode();
                      },
                child: const Text('Reenviar código'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
