import 'package:flutter/material.dart';
import 'viewer_page.dart';
import 'order_page.dart';
import 'explore_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [OrderPage(), ViewerPage(), ExplorePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedItemColor: const Color.fromRGBO(41, 105, 91, 1),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                color: currentPage == 0
                    ? Color.fromRGBO(174, 236, 222, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.coffee),
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                color: currentPage == 1
                    ? Color.fromRGBO(174, 236, 222, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.zoom_in),
            ),
            label: 'View',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                color: currentPage == 2
                    ? Color.fromRGBO(174, 236, 222, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.grid_view),
            ),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}
