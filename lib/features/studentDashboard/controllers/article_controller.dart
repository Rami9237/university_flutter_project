import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/article.dart';

class ArticleController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  var articles = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch articles based on user's subscribed categories
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      // Get the current user's ID
      final userId = _auth.currentUser!.uid;
      // Fetch categories subscribed by the user
      final QuerySnapshot<Map<String, dynamic>> userSnapshot = await _firestore
          .collection('CategoriesSubscription')
          .where('userID', isEqualTo: userId)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        List<dynamic> subscribedCategories =
            userSnapshot.docs.first.data()['CategoriesSub'];

        // Fetch articles for the subscribed categories
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
            .collection('Articles')
            .where('Category', whereIn: subscribedCategories)
            .get();

        // Map the query snapshot to Article objects
        List<Article> fetchedArticles = querySnapshot.docs.map((doc) {
          final data = doc.data();
          return Article(
            Author: data['Author'] ?? '',
            Title: data['Title'] ?? '',
            Description: data['Description'] ?? '',
            UrlToImage: data['UrlToImage'] ?? '',
            PublishedAt: data['publishedAt'] ?? '',
            Category: data['Category'] ?? '',
          );
        }).toList();

        // Set articles list
        articles.value = fetchedArticles;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print('User data not found.');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error fetching articles: $e');
    }
  }
}
