import 'package:flutter/material.dart';

import 'screens/history/history_page.dart';
import 'screens/news/news_page.dart';
import 'screens/results/results_page.dart';
import 'screens/animation/wave_animation.dart';

class AppBarWithTabs extends StatefulWidget {
  const AppBarWithTabs({
    super.key,
  });

  @override
  State<AppBarWithTabs> createState() => _AppBarWithTabsState();
}

class _AppBarWithTabsState extends State<AppBarWithTabs>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  bool _iconBool = true;
  bool isDark = true;
  bool isSelected = true;

  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(255, 255, 255, 255) : Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250,
              collapsedHeight: 120,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 50, top: 30),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/logos/logo_light.png",
                    ),
                  ),
                  WaveAnimationDark(),
                  WaveAnimation(),
                ],
              ),
              title: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 200),
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 200),
                                    child: Text('Dark Mode'),
                                  ),
                                  Switch(
                                    value: isSelected,
                                    activeColor: Colors.black12,
                                    onChanged: (bool value) {
                                      setState(() {
                                        isSelected = value;
                                        isDark = !isDark;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Color.fromARGB(255, 0, 53, 96),
              pinned: true,
              floating: false,
              snap: false,
              bottom: TabBar(
                indicatorColor: Colors.white,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Results',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            NewsPage(),
            ResultsPage(),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}
