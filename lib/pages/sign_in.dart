import 'dart:async';

import 'package:e_com/pages/show_commerse.dart';
import 'package:e_com/service/reqres_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../model/reqres_user_model.dart';

class SignInCommerse extends StatefulWidget {
  const SignInCommerse({super.key});

  @override
  State<SignInCommerse> createState() => _SignInCommerseState();
}

class _SignInCommerseState extends State<SignInCommerse> {
  TextEditingController emailController =
      TextEditingController(text: "michael.lawson@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "Michael");
  late Color buttonColor = Colors.black;
  ReqresUserService _reqresUser = ReqresUserService();
  List<Datum?> userss = [];
  int numberCheck = 1;
  bool errorCheck = false;
  String errorText = "";
  bool checkAnswer = false;
  @override
  void initState() {
    super.initState();
    _reqresUser.reqresUserMethod().then((value) {
      setState(() {
        if (value != null) {
          userss = value.data;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://wallpaperboat.com/wp-content/uploads/2020/05/08/40580/black-and-white-20.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(
                height: 280,
              ),
              Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width / 1.09,
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                  controller: passwordController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.09,
                margin: EdgeInsets.only(left: 20),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                  controller: emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      labelText: 'email',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              checkAnswer
                  ? LoadingAnimationWidget.flickr(
                      leftDotColor: Colors.red,
                      rightDotColor: Colors.green,
                      // color: Colors.black,
                      size: 50,
                    )
                  : Text(""),
              errorCheck
                  ? Text(
                      errorText,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    )
                  : Text(""),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width / 1.09,
                height: MediaQuery.of(context).size.height / 15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor, // Background color
                  ),
                  onPressed: (() {
                    setState(() {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        for (int i = 0; i < userss.length; i++) {
                          if (userss[i]!.email == emailController.text &&
                              userss[i]!.firstName == passwordController.text) {
                            numberCheck = 2;
                            errorCheck = false;
                            buttonColor = Colors.transparent;
                            checkAnswer = true;
                            Timer(Duration(seconds: 4), () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => ShowCommerse(
                                        idApi: i,
                                      ))));
                            });
                          }
                          if (numberCheck != 2) {
                            errorCheck = true;
                            errorText = "Parol ve ya emailiniz yanlisdir";
                          }
                        }
                      }
                    });
                  }),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
