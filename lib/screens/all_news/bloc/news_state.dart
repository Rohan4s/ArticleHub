

import 'package:equatable/equatable.dart';

import '../model/news_model.dart';

abstract class NewsState extends Equatable{

}


class NewsInit extends NewsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class NewsLoading extends NewsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class NewsLoaded extends NewsState{

  List<NewsModel> newsList=[];
  NewsLoaded({required this.newsList});
  @override
  // TODO: implement props
  List<Object?> get props => [newsList];

}
class NewsError extends NewsState{
  String errorMessage;
  NewsError({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class NewsSearch extends NewsState{
  List<NewsModel> newsList = [];
  NewsSearch({required this.newsList});
  @override
  // TODO: implement props
  List<Object?> get props => [newsList];

}

