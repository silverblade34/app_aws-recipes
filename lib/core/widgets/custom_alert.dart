import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String message;
  final AlertType type;

  const CustomAlert({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // Definir estilos según el tipo de alerta
    String title;
    IconData icon;
    Color backgroundColor;

    switch (type) {
      case AlertType.WARNING:
        title = '¡Alerta!';
        icon = Icons.warning_rounded;
        backgroundColor = Colors.orangeAccent;
        break;
      case AlertType.ERROR:
        title = '¡Atención!';
        icon = Icons.error;
        backgroundColor = Colors.redAccent;
        break;
      case AlertType.SUCCESS:
        title = '¡Logrado!';
        icon = Icons.check_circle_outline_rounded;
        backgroundColor = Colors.green;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  message,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Enum para los tipos de alerta
enum AlertType { WARNING, ERROR, SUCCESS }
