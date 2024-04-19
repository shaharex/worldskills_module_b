import 'dart:convert';

import 'package:flutter/material.dart';

import 'news.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> newsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    newsFuture = getNews(context);
  }

  static Future<List<News>> getNews(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("data/news.json");

    final body = jsonDecode(data);
    return body.map<News>(News.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: newsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final news = snapshot.data!;

          return Padding(
              padding: EdgeInsets.only(top: 10), child: buildNews(news));
        } else {
          return const Text('No news data');
        }
      },
    );
  }

  ListView buildNews(List<News> news) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          height: 7,
          color: Colors.transparent,
        );
      },
      itemCount: news.length,
      itemBuilder: (context, int index) {
        final newsData = news[index];
        return Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) => NewsDetail(
                            title: newsData.title,
                            summary: newsData.summary,
                            image: newsData.image,
                            content: newsData.content,
                          ))));
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 215, 215, 215),
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 130,
                    height: 80,
                    child: Image.asset(
                      "images/news/" + newsData.image,
                      fit: BoxFit.cover,
                    ),
                    // ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          newsData.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 50, 92),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                          width: 150,
                          child: Text(
                            newsData.summary,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
