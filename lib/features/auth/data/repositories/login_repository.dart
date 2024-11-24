import 'package:app_aws_recipes/features/auth/data/dtos/login_dto.dart';
import 'package:app_aws_recipes/features/auth/data/providers/login_provider.dart';

class LoginRepository {
  LoginProvider loginProvider = LoginProvider();

  Future<LoginDto> authLogin(String username, String password) async {
    final response = await loginProvider.authLogin(username, password);
    if (response.data == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.statusCode == 400) {
      throw Exception("Error desconocido");
    } else if (response.statusCode == 404) {
      throw Exception(response.data);
    } else if (response.data["status"] == false) {
      throw Exception(response.data);
    }
    final body = response.data;
    LoginDto data = LoginDto.fromJson(body);
    return data;
  }
}
