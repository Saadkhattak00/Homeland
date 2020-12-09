import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_land/homlandpage.dart';
import 'mapping.dart';

class detailpage extends StatefulWidget {
  static String id = 'detailpage';
  String image;
  String Text;
  String Price;
  detailpage({this.image, this.Text, this.Price});

  @override
  _detailpageState createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      body: Column(
        children: [
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(widget.image))),
              ),
            ),
            Positioned(
              top: 10,
              left: 15,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey.shade900,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, homelandpage.id);
                  }),
            ),
          ]),
          Expanded(
            child: Container(
                transform: Matrix4.translationValues(0, -17, 0),
                decoration: BoxDecoration(
                    color: Color(0xFF1B1B1B),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.zero,
                        bottomLeft: Radius.zero)),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: -70,
                      left: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            BedCategroy(
                              bedname: 'King\'s \n  Bed',
                              price: '\$60',
                            ),
                            BedCategroy(
                              bedname: 'Deluxe\'s \n   Bed',
                              price: '\$55',
                            ),
                            BedCategroy(
                              bedname: 'Panel\'s \n   Bed',
                              price: '\$50',
                            ),
                            BedCategroy(
                              bedname: 'Platform \n     Bed',
                              price: '\$40',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.Text,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Description:',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 110,
                              child: Text(
                                mapping[widget.Text],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.Price,
                                  style: TextStyle(
                                      color: Color(0xFFF1D557), fontSize: 25),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    ));
  }
}

class BedCategroy extends StatelessWidget {
  String bedname;
  String price;
  BedCategroy({this.bedname, this.price});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
            color: Color(0xFF1B1B1B),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white38)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bedname,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.king_bed_sharp,
              color: Colors.grey,
              size: 30,
            ),
            Text(
              price,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
