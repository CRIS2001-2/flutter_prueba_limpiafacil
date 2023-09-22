import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  final String name;
  final String
      details; // Asumiendo que quieres mostrar detalles adicionales en texto
  final bool isSelected;
  final Function(bool?) onChanged;

  const CustomCategoryCard({
    Key? key,
    required this.name,
    required this.details,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        leading: Checkbox(
          value: isSelected,
          onChanged: (value) {
            onChanged(value);
          },
        ),
        title: Text(name),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(details),
          ),
        ],
      ),
    );
  }
}
