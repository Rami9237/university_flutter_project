import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Article image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.UrlToImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Article title
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              article.Title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Article description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              article.Description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          // Article author and date
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  'By ${article.Author}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '| ${DateFormat('MMM dd, yyyy').format(DateTime.parse(article.PublishedAt))}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
