import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_aws_recipes/config/constants/colors.dart';
import 'package:app_aws_recipes/config/constants/fonts.dart';
import 'package:app_aws_recipes/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: AppFonts.titleAppBar),
        backgroundColor: AppColors.secondaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            tooltip: 'Cerrar sesión',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Cierre de sesión'),
                    content: const Text('¿Estás seguro de que deseas salir?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Aceptar'),
                        onPressed: () async {
                          box.erase();
                          await Amplify.Auth.signOut();
                          Get.offAllNamed("/login");
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child:
            Container(padding: const EdgeInsets.all(20), child: const Text("Home")),
      ),
    );
  }
}
