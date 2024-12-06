import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedNavBar extends StatefulWidget {
  const AnimatedNavBar({super.key});

  @override
  State<AnimatedNavBar> createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar> {
  final ScrollController scrollController = ScrollController();
  bool isContainerVisible = true;

  int selectedIndex = 0;
  final navItems = [
    "Home",
    "Wallet",
    "Setting",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Motion"),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if(scrollController.position.userScrollDirection == ScrollDirection.reverse) {
            // User is scrolling down;
            setState(() {
              isContainerVisible = false;
            });
          } else if (scrollController.position.userScrollDirection == ScrollDirection.forward){
            setState(() {
              isContainerVisible = true;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            ListView.builder(
              controller: scrollController,
              itemCount: 50,
              itemBuilder: (c, i) => ListTile(
                title: Text("Title ${i + 1}"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _navBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget _navBar() {
    final icons = [
      Icons.home,
      Icons.account_balance_wallet,
      Icons.settings,
    ];

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      height: isContainerVisible ? 60 : 0,
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 24,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icons[index],
                  color: selectedIndex == index ? Colors.blue : Colors.grey,
                  size: isContainerVisible ? 24 : 0,
                ),
                Text(
                  navItems[index],
                  style: TextStyle(
                    fontSize: isContainerVisible ? 12 : 0,
                    color: selectedIndex == index ? Colors.blue : Colors.grey,
                    fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

}