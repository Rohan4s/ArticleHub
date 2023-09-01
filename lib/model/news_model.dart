// import 'package:intl/intl.dart';
//
// class NewsModel {
//   String? sourceId;
//   String? sourceName;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   String? publishedAt;
//   String? content;
//
//   NewsModel(
//       {this.sourceId,
//       this.sourceName,
//       this.author,
//       this.title,
//       this.description,
//       this.url,
//       this.content,
//       this.publishedAt,
//       this.urlToImage});
//
//   NewsModel.fromJson(Map<String, dynamic> json) {
//     sourceName = (json['source'] != null) ? json['source']['name'] : '';
//     sourceId = (json['source'] != null) ? json['source']['id'] : '';
//     author = json['author'] ?? 'No Author Found';
//     title = json['title'] ?? 'No Title Found';
//     description = json['description'] ?? 'No Description Available';
//     url = json['url'] ?? 'No Link Found';
//     urlToImage = json['urlToImage'] ?? 'No Image Found';
//
//     if (json['publishedAt'] != null && json['publishedAt'] != 'No Date Found') {
//       DateTime parsedData =
//           DateTime.parse(json['publishedAt'] ?? DateTime.now());
//       String formattedTime =
//           DateFormat("yyyy-MM-ddTHH:mm:ss'Z'").format(parsedData);
//       publishedAt = formattedTime;
//       // print(formattedTime);
//     } else {
//       publishedAt = 'No Date Found';
//     }
//
//     content = json['content'] ?? 'No Content Found';
//   }
//
//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> json = Map<String, dynamic>();
//
//     json['source_id'] = sourceId;
//     json['source_name'] = sourceName;
//     json['author'] = author;
//     json['title'] = title;
//     json['description'] = description;
//     json['url'] = url;
//     json['urlToImage'] = urlToImage;
//     json['publishedAt'] = publishedAt;
//     json['content'] = content;
//
//     return json;
//   }
// }
//
// class Source {
//   String? id;
//   String? name;
//
//   Source({this.id, this.name});
//
//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? '';
//     name = json['name'] ?? '';
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//
//     data['id'] = id;
//     data['name'] = name;
//
//     return data;
//   }
// }
