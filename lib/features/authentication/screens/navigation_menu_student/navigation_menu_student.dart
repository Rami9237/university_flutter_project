import 'package:flutter/material.dart';

class NavigationMenuScreen extends StatelessWidget {
  const NavigationMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView(
        children: [
          CategoryItem(
            title: 'Mathematics',
            iconData: Icons.calculate,
            onTap: () {
              // Handle onTap for Mathematics category
            },
          ),
          CategoryItem(
            title: 'Science',
            iconData: Icons.science,
            onTap: () {
              // Handle onTap for Science category
            },
          ),
          CategoryItem(
            title: 'History',
            iconData: Icons.history,
            onTap: () {
              // Handle onTap for History category
            },
          ),
          // Add more CategoryItems as needed
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NavigationMenuScreen(),
  ));
}
