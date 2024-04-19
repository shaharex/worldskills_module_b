import 'dart:convert';

import 'package:flutter/material.dart';

import 'result_detail_page.dart';
import 'results.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late Future<List<Results>> resultsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resultsFuture = getResults(context);
  }

  static Future<List<Results>> getResults(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("data/results.json");

    final body = jsonDecode(data);
    return body.map<Results>(Results.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mock data'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/icons/gold.png',
                    width: 20,
                  ),
                  Image.asset(
                    'images/icons/silver.png',
                    width: 20,
                  ),
                  Image.asset(
                    'images/icons/bronze.png',
                    width: 20,
                  ),
                  Image.asset(
                    'images/icons/excellence.png',
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: resultsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final results = snapshot.data!;

                return buildResults(results);
              } else {
                return const Text('No results data');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildResults(List<Results> results) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final resultsData = results[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ResultsDetails(
                          image: resultsData.member,
                          member: resultsData.member,
                        )));
          },
          contentPadding: const EdgeInsets.all(10),
          tileColor: const Color.fromARGB(255, 226, 226, 226),
          title: Text(resultsData.member),
          leading: Image.asset(
            "images/flags/${resultsData.member}.png",
            width: 70,
          ),
          subtitle: Text('#${resultsData.rank}'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide.none,
          ),
          trailing: RichText(
            text: TextSpan(
              text: " ${resultsData.gold} ",
              style: const TextStyle(color: Color.fromARGB(255, 236, 199, 88)),
              children: [
                TextSpan(
                    text: ' ${resultsData.silver} ',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 111, 173, 244),
                    )),
                TextSpan(
                    text: ' ${resultsData.bronze} ',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 230, 150, 80))),
                TextSpan(
                    text: ' ${resultsData.excellence} ',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 167, 167, 167))),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 20,
          color: Colors.transparent,
        );
      },
    );
  }
}
