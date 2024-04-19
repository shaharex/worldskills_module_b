// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
          title: Align(
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

class ListOfMedalists extends StatelessWidget {
  const ListOfMedalists({super.key});

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
      Color.fromARGB(255, 236, 199, 88),
      Color.fromARGB(255, 111, 173, 244),
      Color.fromARGB(255, 230, 150, 80),
    ];

    return SizedBox(
      height: 400,
      width: 400,
      child: ListView.builder(
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
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            width: 130,
                            color: const Color.fromARGB(255, 226, 226, 226),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'images/avatars/avatar-1.png',
                                  ),
                                ),
                                const Text(
                                  'Theodore Shankles',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  'Plumbing and Heating',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 131, 131, 131),
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          }),
    );
  }
}
