import 'package:flutter/material.dart';
import 'package:flutter_amazon/bodies/menu_body.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Provider2>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.cyan.shade300,
      body: MenuBody(),
      bottomNavigationBar: provider.buildBottomNavigationBar(context),
      bottomSheet: BottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            side: BorderSide(width: 1, color: Colors.white)),
        onClosing: () {},
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 5.0),
                      blurRadius: 10.0,
                      color: Colors.grey.shade50),
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            height: MediaQuery.of(context).size.height * .11,
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 7, bottom: 15),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: topBarWidgets.length,
                            itemBuilder: (_, index) {
                              return topBarWidgets[index];
                            }))),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
          );
        },
      ),
    );
  }

  List topBarWidgets = [
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Center(
        child: Chip(
          backgroundColor: Colors.white,
          label: Text(
            'Your Orders',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(25)),
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Center(
          child: Chip(
        backgroundColor: Colors.white,
        label: Text(
          'Buy Again',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      )),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20)),
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Center(
          child: Chip(
        backgroundColor: Colors.white,
        label: Text(
          'Your Account',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      )),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20)),
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Center(
          child: Chip(
        backgroundColor: Colors.white,
        label: Text(
          'Lists',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      )),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20)),
    ),
  ];
}
