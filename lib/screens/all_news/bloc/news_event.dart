
import 'package:equatable/equatable.dart';

import 'package:test_project/models/local/news.dart';

abstract class NewsEvent extends Equatable{

}

class GetAllNews extends NewsEvent{
  String newsType; // apple,tesla etc
  GetAllNews({required this.newsType});
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class GetSearchedNews extends NewsEvent{

  String query,newsType;
  List<News> newsList=[];
  GetSearchedNews({required this.query,required this.newsList,required this.newsType});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}