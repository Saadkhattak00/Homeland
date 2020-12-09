import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:home_land/login.dart';

class welcome extends StatefulWidget {
  static String id = 'welcome';
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> with TickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, login.id);
    });
    controller = AnimationController(
      value: 0.0,
      lowerBound: -1,
      upperBound: 1,
      vsync: this,
      duration: Duration(seconds: 7),
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height - 24,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF1B1B1B),
        child: Column(
          children: [
            //clipper Box......
            AnimatedBuilder(
              animation: controller,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Color(0xFFF1D557),
              ),
              builder: (BuildContext context, Widget child) {
                return ClipPath(
                  clipper: DrawClip(controller.value),
                  child: child,
                );
              },
            ),
            Container(
                child: Center(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 75,
                  height: 80,
                  child: Icon(
                    Icons.home_outlined,
                    color: Color(0xFFF1D557),
                    size: 80,
                  ),
                ),
                Container(
                  width: 200,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WELCOME TO',
                          style: TextStyle(
                            color: Color(0xFFF1D557),
                            fontSize: 20,
                          )),
                      Text('HOMELAND',
                          style: TextStyle(
                            color: Color(0xFFF1D557),
                            fontSize: 35,
                          )),
                    ],
                  ),
                )
              ],
            ))),
          ],
        ),
      ),
    ));
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double x =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double y = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(x, y, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
