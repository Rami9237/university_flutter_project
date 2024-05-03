import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../screens/navigation_menu_student.dart';

class CategorySelectionController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxBool isLoading = true.obs;
  RxList<String> selectedCategories = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('Categories').get();

      categories.assignAll(querySnapshot.docs.map((doc) {
        final data = doc.data();
        return CategoryModel(
          id: doc.id, // Move id assignment here
          name: data['name'],
          image: data['image'] ?? '',
          isSelected: false,
        );
      }).toList());
      isLoading.value = false;
      print(categories);
    } catch (e) {
      isLoading.value = false;
      print('Error fetching categories: $e');
    }
  }

  void toggleCategory(CategoryModel category) {
    // Toggle the isSelected property of the category
    category.isSelected = !category.isSelected;

    // If category is selected, add its ID to selectedCategories
    if (category.isSelected) {
      selectedCategories.add(category.id);
    } else {
      // If category is deselected, remove its ID from selectedCategories
      selectedCategories.remove(category.id);
    }

    // Notify listeners about the change
    categories.refresh();
  }

  void subscribeToCategories() {
    // Get the selected categories
    final selectedCategories =
        categories.where((cat) => cat.isSelected).toList();

    // Get the names of selected categories
    final selectedCategoryNames =
        selectedCategories.map((cat) => cat.name).toList();

    // Notify the user that they have subscribed to the selected categories
    print('Subscribed to categories: $selectedCategoryNames');
  }

  Future<void> updateUserCategoriesSubscription(String userId) async {
    try {
      // Reference to the CategoriesSubscription document for the user
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('CategoriesSubscription')
          .where('UserID', isEqualTo: userId)
          .get();
      final DocumentReference userSubscriptionRef =
          querySnapshot.docs.first.reference;

      // Update the user's subscription with the selected categories
      await userSubscriptionRef.set({
        'CategoriesSub': selectedCategories.value,
      }, SetOptions(merge: true));

      print('User categories subscription updated successfully.');
      Get.offAll(NavigationMenuScreen());
    } catch (e) {
      print('Error updating user categories subscription: $e');
    }
  }
}

class CategoryModel {
  final String id;
  final String name;
  final String image;
  bool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isSelected,
  });
}
