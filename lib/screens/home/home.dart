import 'package:flutter/material.dart';
import 'package:test_project/pages/apple_news.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllNews(newsType: 'apple',title: 'Apple News')));
            },
            icon: Icon(Icons.newspaper),
            label: Text('Apple News'),

          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllNews(newsType: 'tesla',title: 'Tesla News',)));
            },
            icon: Icon(Icons.newspaper),
            label: Text('Tesla News'),
          ),


        ],
      ),
    );
  }
}
