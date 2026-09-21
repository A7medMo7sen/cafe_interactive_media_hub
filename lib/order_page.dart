import 'package:flutter/material.dart';
import 'data.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 245, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.coffee,
          color: const Color.fromRGBO(41, 105, 91, 1),
        ),
        title: const Text(
          'Cafe Orders',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight(600),
            letterSpacing: 1,
          ),
        ),
        titleSpacing: -5,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Menu Items',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight(600)),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromRGBO(41, 105, 91, 1),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Barista live',
                        style: TextStyle(
                          color: const Color.fromRGBO(41, 105, 91, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0.5,
                      color: const Color.fromRGBO(245, 236, 231, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(175, 239, 222, 1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                item['icon'] as IconData,
                                size: 30,
                                color: const Color.fromRGBO(41, 105, 91, 1),
                              ),
                            ),
                            SizedBox(width: 10),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          item['name'] as String,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight(600),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      if (item['badge'] != null)
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                              133,
                                              196,
                                              180,
                                              1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
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
                                  Text(
                                    item['description'] as String,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight(400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(174, 236, 222, 1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                '\$${(item['price'] as double).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight(600),
                                  color: Color.fromRGBO(41, 105, 91, 1),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),

                            Material(
                              borderRadius: BorderRadius.circular(50),

                              child: InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {},
                                child: Ink(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(41, 105, 91, 1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: const Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
