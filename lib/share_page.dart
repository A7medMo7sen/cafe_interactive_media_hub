import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key, required this.category});
  final Map category;
  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 245, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(245, 236, 231, 1),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, size: 20),
                      ),
                    ),
                    Text(
                      'ITEM DETAILS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(245, 236, 231, 1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 60,
                            spreadRadius: 60,
                            offset: Offset(0, 20),

                            color: Color.fromRGBO(177, 239, 225, 0.4),
                          ),
                        ],
                      ),
                    ),
                    //the green Ring
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            blurRadius: 10,
                            spreadRadius: -12,
                          ),
                        ],
                        border: Border.all(
                          color: const Color.fromRGBO(174, 236, 222, 1),
                          width: 20,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.blur_on_outlined,
                        size: 80,
                        color: const Color.fromRGBO(41, 105, 91, 1),
                      ),
                    ),

                    FractionalTranslation(
                      translation: Offset(1.9, 2),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, .2),
                              spreadRadius: -1,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.auto_awesome,
                          size: 30,
                          color: const Color.fromRGBO(41, 105, 91, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(174, 236, 222, 1),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color.fromRGBO(43, 104, 93, 1),
                        size: 10,
                      ),
                      SizedBox(width: 4),
                      const Text('Interactive Present'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.category['title'] as String,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight(600)),
                ),
                Text('Category ID:${widget.category['categoryId'] as String}'),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customContainer(
                      title: 'Format: High-Res',
                      icon: Icons.high_quality_outlined,
                    ),
                    SizedBox(width: 15),
                    customContainer(
                      title: 'Gestures: Enabled',
                      icon: Icons.pinch_outlined,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                customContainer(
                  title: 'Experience & Features',
                  icon: Icons.info_outline,
                  radius: 20,
                  size: 16,
                  desc: widget.category['description'] as String,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              spreadRadius: -5,
              blurRadius: 20,
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                SharePlus.instance.share(
                  ShareParams(
                    text:
                        '${widget.category['title'] as String}:\n${widget.category['description'] as String}',
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 30),

                backgroundColor: Color.fromRGBO(245, 236, 231, 1),
              ),
              label: const Text(
                'Share',
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              icon: const Icon(
                Icons.share_outlined,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(18),
                  backgroundColor: Color.fromRGBO(41, 105, 91, 1),
                ),
                label: const Text(
                  'Back to Explorer',
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customContainer({
  required String title,
  required IconData icon,
  double radius = 50,
  double size = 12,
  String? desc,
}) {
  return Container(
    padding: desc == null
        ? EdgeInsets.symmetric(horizontal: 12, vertical: 4)
        : EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(245, 236, 231, 1),
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.05),
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color.fromRGBO(41, 105, 91, 1)),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(fontSize: size, fontWeight: FontWeight(600)),
            ),
          ],
        ),
        if (desc != null)
          Text(
            desc,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight(400)),
          ),
      ],
    ),
  );
}
