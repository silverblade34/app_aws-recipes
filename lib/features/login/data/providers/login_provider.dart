import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

final baseUrl = dotenv.env['LINK_API'];

class LoginProvider {
  Future<Response> authLogin(String username, String password) async {
    try {
      Dio dioClient = Dio();
      Map<String, dynamic> payload = {
        "usuario": username,
        "contrasena": password
      };
      final response = await dioClient.post(
        '$baseUrl/usuarios/validar',
        data: payload,
      );

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          "${e.response?.data}",
        );
      } else {
        throw Exception("Error de conexión al servidor: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error inesperado: $e");
    }
  }
}
