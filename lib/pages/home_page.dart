import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:instagaapui/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final _pages = [
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.camera_alt_outlined, color: Colors.black,),
        ),
        title: const Text("Instagram", style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.live_tv, color: Colors.black,),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Linecons.paper_plane, color: Colors.black,),
          )
        ],
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Person",
          ),
        ],
      ),
    );
  }
}
