import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<List<History>> historyFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    historyFuture = getHistory(context);
  }

  static Future<List<History>> getHistory(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("data/history.json");

    final body = jsonDecode(data);
    return body.map<History>(History.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: FutureBuilder(
        future: historyFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final history = snapshot.data!;

            return buildHistory(history);
          } else {
            return const Text('No history data');
          }
        },
      ),
    );
  }

  ListView buildHistory(List<History> history) {
    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, int index) {
        final historyData = history[index];
        return Row(
          children: [
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 2, 52, 94)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Container(
                  width: 2,
                  height: 190,
                  color: const Color.fromARGB(255, 2, 52, 94),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  historyData.date,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    historyData.title,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 50, 91),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 60,
                      child: Image(
                        image: AssetImage('images/logos/${historyData.logo}'),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        historyData.description,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
