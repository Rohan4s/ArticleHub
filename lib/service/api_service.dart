import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:test_project/model/news_model.dart';
import 'package:test_project/models/local/news.dart';

class ApiService {
  getLastMonthsNews(String newsType) async {
    List<News> newsList = [];
    print(newsType);
    DateTime now = DateTime.now();
    DateTime thirtyDaysEarlier = DateTime.now().subtract(Duration(days: 30));
    String formattedNow = DateFormat('yyyy-MM-dd').format(now);
    String formattedthirtyDaysEarlier = DateFormat('yyyy-MM-dd').format(thirtyDaysEarlier);

    String url =
        'https://newsapi.org/v2/everything?q=$newsType&from=$formattedthirtyDaysEarlier&sortBy=publishedAt&apiKey=8fea034475bd41bc8e233a98985c8f88';

    final Dio dio = Dio();

    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['articles'];
        for (var element in data) {
          News news = News.fromJson(element);
          newsList.add(news);
        }
      } else {
        print('status ${response.statusCode}');
        return [];
      }
    } catch (e) {
      rethrow;
    }

    return newsList;
  }
}
