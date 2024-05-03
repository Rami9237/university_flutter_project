import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/article_controller.dart';
import '../models/article.dart';
import 'widgets/article_view.dart';

class NavigationMenuScreen extends StatelessWidget {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Obx(() {
        if (articleController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: articleController.articles.length,
            itemBuilder: (context, index) {
              Article article = articleController.articles[index];
              return ArticleWidget(article: article);
            },
          );
        }
      }),
    );
  }
}
