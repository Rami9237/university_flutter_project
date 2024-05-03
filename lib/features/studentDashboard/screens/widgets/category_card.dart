import 'package:flutter/material.dart';
import '../../controllers/category_selection_controller.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final CategorySelectionController controller;

  const CategoryCard({
    required this.category,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          controller.toggleCategory(category);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              category.image,
              fit: BoxFit.cover,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.isSelected ? 'Selected' : 'Not Selected',
                style: TextStyle(
                  color: category.isSelected ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
