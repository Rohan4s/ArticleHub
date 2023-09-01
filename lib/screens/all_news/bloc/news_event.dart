
import 'package:equatable/equatable.dart';

import '../model/news_model.dart';

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
  List<NewsModel> newsList=[];
  GetSearchedNews({required this.query,required this.newsList,required this.newsType});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}