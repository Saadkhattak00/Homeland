import 'package:flutter/material.dart';
import 'package:home_land/homlandpage.dart';
import 'package:home_land/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class login extends StatefulWidget {
  static String id = 'login';
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final auth = FirebaseAuth.instance;
  String email;
  String password;
  bool circle = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: ModalProgressHUD(
              inAsyncCall: circle,
              progressIndicator: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1B1B1B)),
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Container(
                  color: Color(0xFF1B1B1B),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: clip(),
                        child: Container(
                          color: Color(0xFFF1D557),
                          width: MediaQuery.of(context).size.width,
                          height: 550,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      child: Container(
                                        child: (Text(
                                          'Welcome to',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      child: Container(
                                        child: (Text(
                                          'HOMELAND',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      child: Container(
                                        child: (Text(
                                          'Please login to continue',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFD3C06B),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: TextField(
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18),
                                            onSubmitted: (String value) {
                                              email = value;
                                            },
                                            obscureText: false,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              labelText: 'Email / Username',
                                              hintStyle: TextStyle(
                                                  color: Color(0xFFF2D555)),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFD3C06B),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: TextField(
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18),
                                            onSubmitted: (String value) {
                                              password = value;
                                            },
                                            obscureText: true,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              labelText: 'Password',
                                              hintStyle: TextStyle(
                                                  color: Color(0xFFF2D555)),
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          right: 15,
                                          left: 15,
                                          bottom: 5),
                                      child: Container(
                                        child: MaterialButton(
                                          height: 50,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          color: Color(0xFF1B1B1B),
                                          onPressed: () async {
                                            try {
                                              setState(() {
                                                circle = true;
                                              });
                                              final user = await auth
                                                  .signInWithEmailAndPassword(
                                                      email: email,
                                                      password: password);
                                              if (user != null) {
                                                circle = false;
                                                Navigator.pushNamed(
                                                    context, homelandpage.id);
                                              }
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          elevation: 200,
                                          child: Center(
                                              child: Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                color: Color(0xFFF1D557),
                                                fontSize: 20),
                                          )),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      child: Container(
                                        child: InkWell(
                                          onTap: () {},
                                          child: (Text(
                                            'FORGET PASSWORD?',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'OR',
                                    style: TextStyle(
                                        color: Color(0xFFF1D557), fontSize: 30),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          right: 15,
                                          left: 15,
                                          bottom: 5),
                                      child: Container(
                                        child: MaterialButton(
                                          height: 50,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          color: Color(0xFFF1D557),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, signup.id);
                                          },
                                          elevation: 200,
                                          child: Center(
                                              child: Text(
                                            'SIGNUP',
                                            style: TextStyle(
                                                color: Color(0xFF1B1B1B),
                                                fontSize: 20),
                                          )),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}

class clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.9);
    double x = size.width * 0.5;
    double y = size.height;
    path.quadraticBezierTo(x, y, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
