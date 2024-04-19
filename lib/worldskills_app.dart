import 'package:flutter/material.dart';
import 'app_bar_with_tabs.dart';

class WorldSkillsApp extends StatefulWidget {
  const WorldSkillsApp({super.key});

  @override
  State<WorldSkillsApp> createState() => _WorldSkillsAppState();
}

class _WorldSkillsAppState extends State<WorldSkillsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: AppBarWithTabs(),
    );
  }
}
