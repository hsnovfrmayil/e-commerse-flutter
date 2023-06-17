import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../service/product_service.dart';

class BasketPage extends StatefulWidget {
  late int id;
  BasketPage({super.key, required this.id});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  int idApi = 1;
  ProductService productService = ProductService();
  List<Product?> users = [];

  @override
  void initState() {
    super.initState();
    idApi = widget.id;
    productService.getProductMethod().then((value) {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: users[idApi - 1]!.images.length,
          itemBuilder: ((context, index) {
            return Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(bottom: 50),
              child: Image.network(
                users[idApi - 1]!.images[index],
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            );
          })),
    );
  }
}
