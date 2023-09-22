import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/login_api.dart';
import 'package:flutter_application_1/screens/service.dart';
import 'package:flutter_application_1/services/characteristicPatern.service.dart';

void main() => runApp(const Authentication());

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var user = await LoginApi.login();
                if (user != null) {
                  String? token = await LoginApi.getApiToken();
                  if (token != null) {
                    print("Token recibido: $token");
                    await getCharacteristicsWithToken(token);
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServiceScreen()));
                }
              },
              child: const Text("Login Google"),
            )
          ],
        ),
      ),
    );
  }
}
