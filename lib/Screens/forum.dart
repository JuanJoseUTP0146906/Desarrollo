import 'package:Maravillas360/Screens/pages/explore.dart';
import 'package:Maravillas360/Screens/pages/newsfeed.dart';
import 'package:Maravillas360/Screens/pages/trips.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';


class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  PageController? _pageController;
  int _page = 0;
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          NewsFeed(),
          Explore(),
          Trips(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 15),
          child: Row(
            children: [
              _buildNavItem(0, Iconsax.home),
              SizedBox(width: 10),
              _buildNavItem(1, Ionicons.compass_outline),
              SizedBox(width: 10),
              _buildNavItem(2, Iconsax.menu_board),
              Spacer(),
              _buildAddStoryButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() {
          navigationTapped(index);
        });
        selectItem(index);
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == selectedItem ? Colors.red : Colors.grey[300],
        ),
        child: Center(
          child: Icon(
            icon,
            color: index == selectedItem ? Colors.white : Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildAddStoryButton() {
    return InkWell(
      onTap: () => print('Add Story'),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Center(
            child: Icon(
              Ionicons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController!.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void selectItem(int page) {
    setState(() {
      selectedItem = page;
    });
  }
}
