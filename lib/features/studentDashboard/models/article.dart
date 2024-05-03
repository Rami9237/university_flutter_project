import 'package:intl/intl.dart';

class Article {
  String Author;
  String Title;
  String Description;
  String UrlToImage;
  String PublishedAt;
  String Category; // Added category field

  Article({
    required this.Author,
    required this.Title,
    required this.Description,
    required this.UrlToImage,
    required this.PublishedAt,
    required this.Category, // Added category parameter
  });

  // Utility method to format the publishedAt date
  String formattedPublishedDate() {
    if (PublishedAt != null) {
      DateTime date = DateTime.parse(PublishedAt);
      return DateFormat('MMM dd, yyyy').format(date);
    }
    return '';
  }
}
