import 'package:flutter/material.dart';

import 'package:flutter_amazon/bodies/home_body.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:flutter_amazon/screens/menu_screen.dart';
import 'package:flutter_amazon/screens/shopping_screen.dart';
import 'package:flutter_amazon/screens/user_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print(
      MediaQuery.of(context).size.height * .21,
    );
    print(
      MediaQuery.of(context).size.width * .44,
    );
    // final List<Widget> list = [
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.lightGreen.shade200,
    //         child: Icon(
    //           Icons.settings,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Today\'s Deals'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.orange.shade100,
    //         child: Icon(
    //           Icons.shopping_cart_outlined,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Souq orders'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.blue.shade200,
    //         child: Icon(
    //           Icons.card_giftcard_outlined,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Coupons'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.lightGreen.shade200,
    //         child: Icon(
    //           Icons.shopping_cart_outlined,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Supermarket'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.pink.shade100,
    //         child: Icon(
    //           Icons.shopping_cart_outlined,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Fashion'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.orange.shade100,
    //         child: Icon(
    //           Icons.shopping_cart_outlined,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Models'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.pink.shade50,
    //         child: Icon(
    //           Icons.message,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Home'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.orange.shade100,
    //         child: Icon(
    //           Icons.message,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Toys'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.pink.shade100,
    //         child: Icon(
    //           Icons.message,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Beauty'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.lightBlueAccent.shade700,
    //         child: Icon(
    //           Icons.computer,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text('Electronics'),
    //     ],
    //   ),
    //   Column(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.lightBlueAccent,
    //         child: Icon(
    //           Icons.message,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       Text('COVID-19'),
    //     ],
    //   ),
    // ];

    List<Widget> screens = [
      HomeBody(),
      UserScreen(),
      ShoppingScreen(),
      MenuScreen(),
    ];
    var provider2 = Provider.of<Provider2>(context, listen: true);

    // List appBars = [
    //   AppBar(
    //     flexibleSpace: provider2.buildFlexibleSpace(context, 0),
    //   ),
    //   userAppBar(),
    //   shoppingAppBar(),
    //   menuAppBar(),
    // ];
    return screens[provider2.currentIndex];
  }
}
