import 'package:flutter/material.dart';

class ViewerPage extends StatefulWidget {
  const ViewerPage({super.key});

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  double scale = 1.0;
  double startScale = 1.0;
  Offset offset = Offset.zero;
  Offset startOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 48, 44, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),

          child: Image.asset(
            'assets/images/ViewLogo.jpg',
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onScaleStart: (details) {
              startOffset = offset;
              startScale = scale;
            },

            onScaleUpdate: (details) {
              setState(() {
                scale = (startScale * details.scale).clamp(0.5, 6.0);
                offset = offset + details.focalPointDelta;
              });
            },

            onDoubleTap: () {
              setState(() {
                scale = scale != 1.0 ? 1.0 : 2.0;
              });
            },
            onLongPress: () {
              setState(() {
                offset = Offset.zero;
                scale = 1.0;
              });
            },
            child: Transform.translate(
              offset: offset,
              child: Transform.scale(
                scale: scale,
                child: Image.asset('assets/images/latte.jpg'),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromRGBO(133, 196, 180, 1),
                ),
                SizedBox(width: 5),
                Text(
                  'Scale: \n${scale.toStringAsFixed(4)}',
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Current: $offset',
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                SizedBox(width: 20),
                const Icon(
                  Icons.touch_app_outlined,
                  color: Color.fromRGBO(175, 239, 222, 1),
                ),
                const Text(
                  'Gesture 2D',
                  style: TextStyle(color: Color.fromRGBO(175, 239, 222, 1)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
