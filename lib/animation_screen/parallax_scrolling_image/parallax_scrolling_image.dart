import 'package:flutter/material.dart';

import 'exhibition_bottom_sheet.dart';
import 'sliding_cards.dart';

class ParallaxScrollingImage extends StatelessWidget {
  const ParallaxScrollingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                AppBar(),
                const SizedBox(height: 50),
                const SlidingCardsView(),
              ],
            ),
          ),
          const ExhibitionBottomSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}