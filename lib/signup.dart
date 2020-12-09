import 'package:flutter/material.dart';
import 'package:home_land/homlandpage.dart';
import 'package:home_land/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  static String id = 'signup';
  @override
  _signupState createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
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
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF1D557)),
        ),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF1B1B1B),
            child: Column(
              children: [
                ClipPath(
                  clipper: Clip(),
                  child: Container(
                    color: Color(0xFFF1D557),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Container(
                                    child: Text(
                                      'Existing User?',
                                      style: TextStyle(
                                        color: Color(0xFF1B1B1B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
                                    vertical: 5, horizontal: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF1B1B1B),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: MaterialButton(
                                    elevation: 200,
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, login.id);
                                    },
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Color(0xFFF1D557),
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF1B1B1B),
                    width: MediaQuery.of(context).size.width,
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
                                  child: Text(
                                    'Sign up with',
                                    style: TextStyle(
                                        color: Color(0xFFF1D557), fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                              child: Container(
                                child: Text(
                                  'HOMELAND',
                                  style: TextStyle(
                                      color: Color(0xFFF1D557), fontSize: 40),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white10),
                                  child: TextField(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                    onSubmitted: (String value) {
                                      email = value;
                                    },
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: 'Enter Email/Username',
                                        labelStyle:
                                            TextStyle(color: Colors.white12),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white10),
                                  child: TextField(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                    onSubmitted: (String value) {
                                      password = value;
                                    },
                                    obscureText: true,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle:
                                            TextStyle(color: Colors.white12),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFFF1D557)),
                                  child: MaterialButton(
                                    elevation: 200,
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: () async {
                                      try {
                                        setState(() {
                                          circle = true;
                                        });
                                        final user = await auth
                                            .createUserWithEmailAndPassword(
                                                email: email,
                                                password: password);
                                        if (user != null) {
                                          circle = false;
                                          Navigator.pushNamed(
                                              context, login.id);
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          color: Color(0xFF1B1B1B),
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Container(
                                  child: Text(
                                    ' OR signup with ',
                                    style: TextStyle(
                                        color: Color(0xFFF1D557), fontSize: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: ClipOval(
                                child: Material(
                                  color: Color(0xFFF1D557),
                                  child: InkWell(
                                    child: SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: Center(
                                          child: Text(
                                            'f',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF1B1B1B)),
                                          ),
                                        )),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: ClipOval(
                                child: Material(
                                  color: Color(0xFFF1D557),
                                  child: InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: Center(
                                          child: Text(
                                            'G+',
                                            style: TextStyle(
                                                color: Color(0xFF1B1B1B),
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
