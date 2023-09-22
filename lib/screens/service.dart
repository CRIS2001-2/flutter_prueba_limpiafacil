import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/characteristics.dart';
import 'package:flutter_application_1/screens/widgets/custom_widgets.dart';
import 'package:flutter_application_1/services/categories.service.dart';
import 'package:flutter_application_1/services/login_api.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _MyAppState();
}

class _MyAppState extends State<ServiceScreen> {
  final Map<int, bool> _selectedCategories = {};
  late Future<List<AllCategories>> _characteristicsResponse;
  final selectCategory = [];

  @override
  void initState() {
    super.initState();
    _characteristicsResponse = Services.getCharacteristics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Succes Login"),
        actions: [
          IconButton(
              onPressed: () async {
                LoginApi.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: FutureBuilder(
        future: _characteristicsResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: _listCharacteristics(snapshot.data),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("Error!");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> _listCharacteristics(List<AllCategories>? data) {
    List<Widget> characteristics = [];
    if (data != null) {
      for (var characteristic in data) {
        _selectedCategories[characteristic.id] =
            _selectedCategories[characteristic.id] ?? false;

        characteristics.add(
          CustomCategoryCard(
            isSelected: _selectedCategories[characteristic.id]!,
            name: characteristic.name,
            onChanged: (value) {
              setState(() {
                _selectedCategories[characteristic.id] = value!;
                if (value) {
                  selectCategory.add(characteristic.name);
                } else {
                  selectCategory.remove(characteristic.name);
                }
                print(selectCategory);
              });
            },
            details: 'hola, como estás',
          ),
        );
      }
    }
    return characteristics;
  }
}
