import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getCharacteristicsWithToken(String token) async {
  final categories = await http.get(
    Uri.parse(
        'http://pruebas.adnsoftware.com.co/limpiafacil/api/Characteristic/GetCharacteristicByPatern'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (categories.statusCode == 200) {
    return jsonDecode(categories.body);
  } else {
    print('Error al obtener las características: ${categories.statusCode}');
    throw Exception('Failed to load characteristics');
  }
}
