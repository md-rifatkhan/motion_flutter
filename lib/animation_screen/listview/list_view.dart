import 'package:flutter/material.dart';

class AnimatedListView extends StatefulWidget {
  @override
  _AnimatedListViewState createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> with TickerProviderStateMixin {
  // List of fade animations for each ListView item.
  final List<AnimationController> _controllers = [];

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Item Fade Transition"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          // Initialize the AnimationController only when the item is built
          if (_controllers.length <= index) {
            final controller = AnimationController(
              duration: const Duration(seconds: 1),
              vsync: this,
            );
            controller.forward();
            _controllers.add(controller);
          }

          // Use AnimatedBuilder to apply the fade effect to each ListTile
          return AnimatedBuilder(
            animation: _controllers[index],
            builder: (context, child) {
              return FadeTransition(
                opacity: _controllers[index],
                child: ListTile(
                  title: Text("Title ${index + 1}"),
                  leading: const Icon(Icons.star),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
