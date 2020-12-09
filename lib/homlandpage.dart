import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_land/login.dart';
import 'detailpage.dart';

// ignore: camel_case_types
class homelandpage extends StatefulWidget {
  static String id = 'homelandpage';
  @override
  _homelandpageState createState() => _homelandpageState();
}

// ignore: camel_case_types
class _homelandpageState extends State<homelandpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.zero,
                topLeft: Radius.zero,
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Color(0xFF1B1B1B), size: 25),
        ),
        title: Center(
          child: Text(
            'HOMELAND',
            style: TextStyle(
                color: Color(0xFF1B1B1B),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        backgroundColor: Color(0xFFF1D557),
        actions: [
          IconButton(
              icon: Icon(Icons.logout, color: Color(0xFF1B1B1B), size: 25),
              onPressed: () {
                Navigator.pushNamed(context, login.id);
              })
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 2),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.white70,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    labelText: 'Search',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ),
          containers(
            image: 'images/dubaiR.jpg',
            text: 'Dubai Residence',
            Price: '\$250.00',
          ),
          containers(
            image: 'images/astralia.jpeg',
            text: 'Australia Residence',
            Price: '\$350.00',
          ),
          containers(
            image: 'images/canadianE.png',
            text: 'Canada Residence',
            Price: '\$300.00',
          ),
          containers(
            image: 'images/pcRawalpindi.jpg',
            text: 'PC Hotel Rawalpindi',
            Price: '\$200.00',
          ),
          containers(
            image: 'images/ukGold.jpg',
            text: 'United Kingdom Residence',
            Price: '\$280.00',
          ),
        ],
      ),
    ));
  }
}

Color pressed = Colors.grey;
Color unpressed = Colors.red;
Color color = unpressed;

class containers extends StatefulWidget {
  String image;
  String text;
  String Price;
  Color color;
  containers({this.image, this.Price, this.text, this.color});

  @override
  _containersState createState() => _containersState();
}

class _containersState extends State<containers> {
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (Context) {
          return detailpage(
            Price: widget.Price,
            image: widget.image,
            Text: widget.text,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: Column(
            children: [
              Row(
                children: [
                  Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 26,
                      height: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.image),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 12,
                        child: ClipOval(
                          child: Material(
                            color: Colors.white,
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: IconButton(
                                onPressed: () {
                                  if (color == pressed) {
                                    setState(() {
                                      color = unpressed;
                                    });
                                  } else {
                                    setState(() {
                                      color = pressed;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: color == pressed ? unpressed : pressed,
                                ),
                              ),
                            ),
                          ),
                        ))
                  ]),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'Corporate',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              '1 Bed | 1 Baths | 54 Sqft',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        widget.Price,
                        style:
                            TextStyle(color: Color(0xFFF1D557), fontSize: 20),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
