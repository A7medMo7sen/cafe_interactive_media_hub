import 'package:cafe_interactive_media_hub/data.dart';
import 'package:flutter/material.dart';
import 'share_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 245, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),

          child: Image.asset(
            'assets/images/category.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        leadingWidth: 70,
        titleSpacing: 10,
        title: const Text(
          'Cafe Orders',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight(600),
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(41, 105, 91, 1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_outlined, color: Colors.white),
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 15),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category Explorer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight(600),
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: categoryItem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 160,
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final item = categoryItem[index];
                    return Material(
                      borderRadius: BorderRadius.circular(30),
                      clipBehavior: Clip.antiAlias,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 236, 231, 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: -2,
                              blurRadius: 14,
                              color: const Color.fromRGBO(44, 40, 37, 0.06),
                            ),
                          ],
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SharePage(category: item);
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Ink(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(177, 239, 225, 1),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.05),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Icon(item['icon'] as IconData, size: 30),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 35,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(233, 225, 220, 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                item['title'] as String,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight(600),
                                ),
                              ),
                              SizedBox(height: 3),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(233, 225, 220, 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  item['badge'] as String,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight(600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
