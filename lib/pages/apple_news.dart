// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:test_project/bloc/news_bloc.dart';
// import 'package:test_project/bloc/news_event.dart';
// import 'package:test_project/model/news_model.dart';
//
// import '../bloc/news_state.dart';
//
// class AllNews extends StatefulWidget {
//   String title, newsType;
//
//   AllNews({super.key, required this.newsType, required this.title});
//
//   @override
//   State<AllNews> createState() => _AllNewsState();
// }
//
// class _AllNewsState extends State<AllNews> {
//   TextEditingController controller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     context.read<NewsBloc>().add(GetAllNews(newsType: widget.newsType));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewsBloc, NewsState>(
//       builder: (BuildContext context, NewsState state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//               widget.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             backgroundColor: Colors.blue,
//             // centerTitle: true,
//             leading: const BackButton(
//               color: Colors.white,
//               style: ButtonStyle(
//                   // iconSize: 20,
//                   ),
//             ),
//             actions: [],
//           ),
//           body: BlocBuilder<NewsBloc, NewsState>(
//             builder: (BuildContext context, NewsState state) {
//               if (state is NewsLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (state is NewsError) {
//                 return Center(
//                   child: Text(state.errorMessage.toString()),
//                 );
//               } else if (state is NewsLoaded) {
//                 return Column(
//                   children: [
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width - 10,
//                       child: TextField(
//                         controller: controller,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.search),
//                           hintText: 'Search Article',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide(color: Colors.blue),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           context.read<NewsBloc>().add(GetSearchedNews(
//                               query: value,
//                               newsList: state.newsList,
//                               newsType: widget.newsType));
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: state.newsList.length,
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         itemBuilder: (BuildContext context, int index) {
//                           NewsModel news = state.newsList[index];
//
//                           String formattedTime = formatTime(news.publishedAt);
//                           // print(formattedTime);
//
//                           return Card(
//                             clipBehavior: Clip.antiAlias,
//                             child: Column(
//                               children: [
//                                 news.urlToImage != null &&
//                                         news.urlToImage != 'No Image Found'
//                                     ? Image.network(
//                                         news.urlToImage ?? '',
//                                         fit: BoxFit.fill,
//                                         loadingBuilder: (BuildContext context,
//                                             Widget child,
//                                             ImageChunkEvent? loadingProgress) {
//                                           if (loadingProgress == null)
//                                             return child;
//                                           return Center(
//                                             child: CircularProgressIndicator(
//                                               value: loadingProgress
//                                                           .expectedTotalBytes !=
//                                                       null
//                                                   ? loadingProgress
//                                                           .cumulativeBytesLoaded /
//                                                       loadingProgress
//                                                           .expectedTotalBytes!
//                                                   : null,
//                                             ),
//                                           );
//                                         },
//                                       )
//                                     : const Text('No Image Found'),
//                                 ListTile(
//                                   // leading: Icon(Icons.arrow_drop_down_circle),
//                                   title: Text(
//                                     news.title.toString(),
//                                     style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   subtitle: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'by ${news.author}',
//                                         style: TextStyle(
//                                             color:
//                                                 Colors.black.withOpacity(0.6)),
//                                       ),
//                                       Text(
//                                         formattedTime,
//                                         style: TextStyle(
//                                             color:
//                                                 Colors.black.withOpacity(0.6)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Text(
//                                     news.content.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black.withOpacity(0.6)),
//                                   ),
//                                 ),
//
//                                 TextButton.icon(
//                                   onPressed: () {
//                                     // Perform some action
//                                   },
//                                   icon: Icon(Icons.arrow_forward),
//                                   label: const Text('See more'),
//                                 ),
//                                 // Image.asset('assets/card-sample-image-2.jpg'),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 );
//               }
//
//               return const Text('Empty');
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   String formatTime(String? givenTime) {
//     DateTime parsedTime;
//     String formattedTime;
//     if (givenTime != null && givenTime != 'No Date Found') {
//       parsedTime = DateTime.parse(givenTime.toString());
//       formattedTime = DateFormat.yMMMd().add_jms().format(parsedTime);
//     } else {
//       formattedTime = givenTime ?? 'No Date Found';
//     }
//     return formattedTime;
//   }
// }
