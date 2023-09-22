import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class LoginApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future signOut() => _googleSignIn.signOut();

  static Future<String?> getApiToken() async {
    // Obtiene el usuario actualmente autenticado con Google
    GoogleSignInAccount? currentUser = _googleSignIn.currentUser;
    if (currentUser == null) {
      return null;
    }
    final body = jsonEncode({
      'username': currentUser.email, // Usa el email del usuario autenticado
      'password': '123456', // Define un password arbitrario aquí
    });

    final response = await http.post(
      Uri.parse('http://pruebas.adnsoftware.com.co/limpiafacil/api/Login'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      return response.body; // Retorna el token directamente
    } else {
      print('Error al obtener el token: ${response.statusCode}');
      return null;
    }
  }
}
