import 'package:e_com/pages/sign_in.dart';
import 'package:e_com/service/product_service.dart';
import 'package:flutter/material.dart';

import 'model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductService _productService = ProductService();
  List<Product?> users = [];
  @override
  void initState() {
    super.initState();
    _productService.getProductMethod().then((value) {
      setState(() {
        if (value != null) {
          users = value.products;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.001,
                height: MediaQuery.of(context).size.height / 1.001,
                child: Image.network(
                  "https://ailehekimi.az/wp-content/uploads/2021/11/sunflowers.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                left: MediaQuery.of(context).size.width / 4,
                child: const Text(
                  "HaSanov",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.5,
                left: MediaQuery.of(context).size.width / 15,
                child: Column(
                  children: const [
                    Text(
                      "One Click",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "May everything be at your fingertips",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.5,
                left: MediaQuery.of(context).size.width / 20,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                    ),
                    onPressed: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => SignInCommerse())));
                    }),
                    child: Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.3,
                left: MediaQuery.of(context).size.width / 20,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                    ),
                    onPressed: (() {}),
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
