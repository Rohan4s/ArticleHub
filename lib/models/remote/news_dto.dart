import 'package:intl/intl.dart';

class NewsDto {
  String? sourceId;
  String? sourceName;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsDto(
      {this.sourceId,
      this.sourceName,
      this.author,
      this.title,
      this.description,
      this.url,
      this.content,
      this.publishedAt,
      this.urlToImage});

  NewsDto.fromJson(Map<String, dynamic> json) {
    sourceName = (json['source'] != null) ? json['source']['name'] : '';
    sourceId = (json['source'] != null) ? json['source']['id'] : '';
    author = json['author'] ?? 'No Author Found';
    title = json['title'] ?? 'No Title Found';
    description = json['description'] ?? 'No Description Available';
    url = json['url'] ?? 'No Link Found';
    urlToImage = json['urlToImage'] ?? 'No Image Found';

    if (json['publishedAt'] != null && json['publishedAt'] != 'No Date Found') {
      DateTime parsedData =
          DateTime.parse(json['publishedAt'] ?? DateTime.now());
      String formattedTime =
          DateFormat("yyyy-MM-ddTHH:mm:ss'Z'").format(parsedData);
      publishedAt = formattedTime;
      // print(formattedTime);
    } else {
      publishedAt = 'No Date Found';
    }
    content = json['content'] ?? 'No Content Found';
  }
}
