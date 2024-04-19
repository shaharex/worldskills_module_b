import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldskills_module_b1/screens/results/medalist.dart';

import 'result.dart';

class ResultsDetails extends StatelessWidget {
  const ResultsDetails({
    Key? key,
    required this.image,
    required this.member,
  }) : super(key: key);

  final String image;
  final String member;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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
          title: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Results',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              color: const Color.fromARGB(255, 226, 226, 226),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/flags/$image.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(member)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: ListOfMedalists(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListOfMedalists extends StatefulWidget {
  const ListOfMedalists({super.key});

  @override
  State<ListOfMedalists> createState() => _ListOfMedalistsState();
}

class _ListOfMedalistsState extends State<ListOfMedalists> {
  // deconding the Result class

  late Future<List<Result>> resultFuture;

  @override
  void initState() {
    super.initState();
    resultFuture = getResult(context);
  }

  static Future<List<Result>> getResult(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('data/result.json');

    final List<dynamic> body = jsonDecode(data);
    return body.map((json) => Result.fromJson(json)).toList();
  }

  // decoding the Medalist class

  Future<String> _loadCountryDataAsset() async {
    return await rootBundle.loadString('data/result.json');
  }

  Future<Result> _parseCountryData(String jsonString) async {
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return Result.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    List<String> medalsIcons = [
      'images/icons/gold.png',
      'images/icons/silver.png',
      'images/icons/bronze.png',
    ];

    List<String> medalsNames = [
      'Gold',
      'Silver',
      'Bronze',
    ];

    dynamic medalsColor = [
      const Color.fromARGB(255, 236, 199, 88),
      const Color.fromARGB(255, 111, 173, 244),
      const Color.fromARGB(255, 230, 150, 80),
    ];

    return SizedBox(
      height: 400,
      width: 400,
      child: FutureBuilder(
          future: _loadCountryDataAsset(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final String jsonString = snapshot.data as String;

              return FutureBuilder(
                future: _parseCountryData(jsonString),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final Result resultData = snapshot.data as Result;

                    return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  medalsIcons[index],
                                  width: 20,
                                ),
                                Text(
                                  '${medalsNames[index]} Medals',
                                  style: TextStyle(
                                    color: medalsColor[index],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 500,
                              height: 175,
                              child: ListView.separated(
                                itemCount: 4,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 10,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Medalist medalist =
                                      resultData.goldMedals[index];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      width: 130,
                                      color: const Color.fromARGB(
                                          255, 226, 226, 226),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'images/avatars/${medalist.portrait}',
                                            ),
                                          ),
                                          Text(
                                            medalist.name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            medalist.skill,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 131, 131, 131),
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return const Text('no data');
                  }
                },
              );
            } else {
              return const Text('no data');
            }
          }),
    );
  }
}
