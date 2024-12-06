
import 'package:flutter/material.dart';
import 'package:motion/animation_screen/listview/list_view.dart';
import 'package:motion/animation_screen/nav_bar/nav_bar.dart';
import 'package:motion/animation_screen/parallax_scrolling_image/parallax_scrolling_image.dart';
import 'package:motion/animation_screen/swipable_card/swipable_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _navigationTile(
              context,
              title: "Nav Bar",
              icon: Icons.dashboard,
              destination: const AnimatedNavBar(),
            ),
            _navigationTile(
              context,
              title: "Parallax Scrolling",
              icon: Icons.swipe,
              destination: const ParallaxScrollingImage(),
            ),
            _navigationTile(
              context,
              title: "List View",
              icon: Icons.list,
              destination: AnimatedListView(),
            ),

            _navigationTile(
              context,
              title: "Swipable Card",
              icon: Icons.list,
              destination: const SwipableCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigationTile(BuildContext context, {required String title, required IconData icon, required Widget destination}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}