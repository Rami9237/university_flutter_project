import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controllers/category_selection_controller.dart';
import 'widgets/category_card.dart';

class CategorySelectionScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final CategorySelectionController controller = Get.put(
      CategorySelectionController()); // Move controller initialization here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Categories'),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: controller.categories.map((category) {
                      return CategoryCard(
                        controller: controller, // Pass the controller instance
                        category: category,
                      );
                    }).toList(),
                  ),
                ),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateUserCategoriesSubscription(_auth.currentUser!.uid);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
