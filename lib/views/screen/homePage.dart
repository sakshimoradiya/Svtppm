import 'package:flutter/material.dart';
import 'package:media_player/views/screen/songPage.dart';
import 'package:media_player/views/screen/videoPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: TabBarView(
        controller: tabController,
        children:   [
          SongPage(),
          VideoPage(),
        ],
      ),
    );
  }
}
