import 'package:e_com/pages/all_same_home.dart';
import 'package:e_com/pages/basket.dart';
import 'package:e_com/pages/profile.dart';
import 'package:flutter/material.dart';

class ShowCommerse extends StatefulWidget {
  final int idApi;
  ShowCommerse({super.key, required this.idApi});

  @override
  State<ShowCommerse> createState() => _ShowCommerseState();
}

class _ShowCommerseState extends State<ShowCommerse> {
  int index = 0;
  late int idMy = 0;
  @override
  void initState() {
    super.initState();
    idMy = widget.idApi;
  }

  List<Widget> widgetList = [
    AllSameHomePage(),
    BasketPage(
      id: 10,
    ),
    ProfilePage()
  ];
  Widget newWidget = AllSameHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Text(""),
      ),
      body: newWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            newWidget = widgetList[index];
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket_sharp,
                size: 30,
              ),
              label: "Basket"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
