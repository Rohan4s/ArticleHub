import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/helper/news_helper.dart';
import 'package:test_project/models/local/news.dart';
import 'package:test_project/service/api_service.dart';

import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<News> newsList = [];

  NewsBloc() : super(NewsInit()) {

    on<GetAllNews>((event, emit) async {

      SharedPreferences pref = await SharedPreferences.getInstance();
      bool dataLoaded = pref.getBool('${event.newsType}DataLoaded') ?? false;
      print('found ${event.newsType}DataLoaded= $dataLoaded');
      // appleDataLoaded = false;

      if (dataLoaded) {
        emit(NewsLoading());
        newsList = (await NewsHelper.getAllNews(tableName: event.newsType))!;
        emit(NewsLoaded(newsList: newsList));
      } else {
        try {
          emit(NewsLoading());
          ApiService apiService = ApiService();
          newsList = await apiService.getLastMonthsNews(event.newsType);
          emit(NewsLoaded(newsList: newsList));
          await NewsHelper.insertAll(
              newsList: newsList, tableName: event.newsType);
          pref.setBool('${event.newsType}DataLoaded', true);
        } catch (e) {
          emit(NewsError(errorMessage: e.toString()));
        }
      }
    });

    on<GetSearchedNews>((event, emit) async{
      print('search called for ${event.query}');
      // emit(NewsLoading());
      newsList = (await NewsHelper.getAllNews(tableName: event.newsType))!;
      if(event.query==''){
        emit(NewsLoaded(newsList: event.newsList));
        return;
      }

      final searchedList = newsList.where((news) {
        String title = news.title.toString().toLowerCase();
        String input = event.query.toLowerCase();

        return title.contains(input);
      }).toList();
      emit(NewsLoaded(newsList: searchedList));
    });
  }
}
