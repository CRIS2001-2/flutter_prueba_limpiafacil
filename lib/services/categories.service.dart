import 'package:flutter_application_1/models/characteristics.dart';
import 'package:flutter_application_1/services/characteristicPatern.service.dart';
import 'package:flutter_application_1/services/login_api.dart';

class Services {
  static Future<List<AllCategories>> getCharacteristics() async {
    final token = await LoginApi.getApiToken();
    var jsonResponse = await getCharacteristicsWithToken(token!);
    List<AllCategories> characteristics = [];
    for (var item in jsonResponse) {
      characteristics.add(AllCategories(
        id: item['id'],
        name: item['name'],
        level: item['level'],
        padreId: item['padreId'],
        price: item['price'].toDouble(),
      ));
    }
    return characteristics;
  }
}
