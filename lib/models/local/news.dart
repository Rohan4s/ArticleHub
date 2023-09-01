import 'package:intl/intl.dart';
import 'package:test_project/models/remote/news_dto.dart';

class News {
  // String? sourceId;
  String? sourceName;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;


  static News fromDto(NewsDto dto){
    return News()
        ..sourceName=dto.sourceName
        ..author = dto.author
        ..title = dto.title
        ..description = dto.description
        ..url = dto.url
        ..content = dto.content
      ..publishedAt = dto.publishedAt
      ..urlToImage = dto.urlToImage;
  }

  News(
      {
        this.sourceName,
        this.author,
        this.title,
        this.description,
        this.url,
        this.content,
        this.publishedAt,
        this.urlToImage
      });

  News.fromJson(Map<String, dynamic> json) {
    sourceName = (json['source'] != null) ? json['source']['name'] : '';
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

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();

    json['source_name'] = sourceName;
    json['author'] = author;
    json['title'] = title;
    json['description'] = description;
    json['url'] = url;
    json['urlToImage'] = urlToImage;
    json['publishedAt'] = publishedAt;
    json['content'] = content;

    return json;
  }
}

