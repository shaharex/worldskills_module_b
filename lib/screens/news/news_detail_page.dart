// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({
    Key? key,
    required this.title,
    required this.summary,
    required this.image,
    required this.content,
  }) : super(key: key);

  final String title;
  final String summary;
  final String image;
  final String content;

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'News',
              style: TextStyle(fontSize: 16),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 0, 50, 91),
              size: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 2, 35, 61),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.summary,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "images/news/${widget.image}",
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  style:
                      const TextStyle(color: Color.fromARGB(221, 79, 79, 79)),
                  widget.content,
                ),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: toggle
                        ? Icon(Icons.thumb_up)
                        : Icon(Icons.thumb_up_alt_outlined),
                    onPressed: () {
                      setState(() {
                        toggle = !toggle;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
