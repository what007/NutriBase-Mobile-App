import 'package:demoapp/reusable_widgets/reusable_widgets.dart';
import 'package:demoapp/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  // bool showProgress = false;
  bool visible = false;
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //color: Colors.blue[900],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          logoWidget("assets/images/lock.png"),
                          Text(
                            "Forget\nPassword",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Provide your account's email for which you want to reset your password!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              hintText: 'Email',
                              enabled: true,
                              prefixIcon: Icon(Icons.email),
                              contentPadding: const EdgeInsets.only(
                                left: 14.0,
                                bottom: 8.0,
                                top: 14.5,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Email cannot be empty";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid email");
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              // emailController.text = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),

                          // TextFormField(
                          //   controller: emailController,
                          //   decoration: InputDecoration(
                          //     filled: true,
                          //     fillColor: Colors.white,
                          //     hintText: 'Email',
                          //     enabled: true,
                          //     contentPadding: const EdgeInsets.only(
                          //         left: 14.0, bottom: 8.0, top: 8.0),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: new BorderSide(color: Colors.white),
                          //       borderRadius: new BorderRadius.circular(20),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: new BorderSide(color: Colors.white),
                          //       borderRadius: new BorderRadius.circular(20),
                          //     ),
                          //   ),
                          //   textInputAction: TextInputAction.done,
                          //   validator: (value) {
                          //     if (value!.length == 0) {
                          //       return "Email cannot be empty";
                          //     }
                          //     if (!RegExp(
                          //             "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          //         .hasMatch(value)) {
                          //       return ("Please enter a valid email");
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          //   onSaved: (value) {
                          //     // emailController.text = value!;
                          //   },
                          //   keyboardType: TextInputType.emailAddress,
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                elevation: 5.0,
                                height: 40,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                elevation: 5.0,
                                height: 40,
                                onPressed: () {
                                  Forgotpassss(emailController.text);
                                  setState(() {
                                    visible = true;
                                  });
                                },
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                            ],
                          ),

                          // Visibility(
                          //     maintainSize: true,
                          //     maintainAnimation: true,
                          //     maintainState: true,
                          //     visible: visible,
                          //     child: Container(
                          //         child: CircularProgressIndicator(
                          //       color: Colors.white,
                          //     ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   color: Colors.white,
              //   width: MediaQuery.of(context).size.width,
              //   child: Center(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           height: 10,
              //         ),
              //         SizedBox(
              //           height: 40,
              //         ),
              //         Text(
              //           "Made by",
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Text(
              //           "WEBFUN",
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 30,
              //             color: Colors.yellowAccent[400],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void Forgotpassss(String email) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()))
              })
          .catchError((e) {});
    }
  }
}
