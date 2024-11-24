import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_aws_recipes/config/constants/assets.dart';
import 'package:app_aws_recipes/config/constants/colors.dart';
import 'package:app_aws_recipes/config/constants/fonts.dart';
import 'package:app_aws_recipes/features/home/controllers/home_controller.dart';
import 'package:app_aws_recipes/features/home/presentation/widgets/card_option.dart';
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
        title: const Text('Centro de control', style: AppFonts.titleAppBar),
        backgroundColor: AppColors.primaryColor,
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
      backgroundColor: AppColors.darkGrey,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bienvenido",
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.nameUser.value,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(
                children: [
                  const Text(
                    "Base: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    controller.nameBase.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              CardOption(
                title: "SALIDA DE UNIDADES",
                background: AppColors.blueLight,
                imagepath: AppAssets.homeSalidaUnidades,
                onTap: () {
                  Get.toNamed("/units");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CardOption(
                title: "LISTA DE ESPERA",
                background: AppColors.redLight,
                imagepath: AppAssets.homeListaEspera,
                onTap: () {
                  Get.toNamed("/units");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
