import 'package:flutter/material.dart';

class Provider2 extends ChangeNotifier {
  int currentIndex = 0;

  changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<double> leftMargin = [
    1 / 16,
    1 / 3.3,
    1 / 1.8,
    1 / 1.24,
  ];

  Widget buildBottomNavigationBar(context) {
    return Container(
      color: Colors.white,
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width *
                        leftMargin[currentIndex]),
                width: 50,
                height: 7,
                decoration: BoxDecoration(
                    color: Colors.teal.shade900,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),
            ],
          ),
          BottomNavigationBar(
            onTap: (index) {
              changeCurrentIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.black87,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home_outlined,
                  )),
              BottomNavigationBarItem(
                  label: 'User',
                  icon: Icon(
                    Icons.person_outline_rounded,
                  )),
              BottomNavigationBarItem(
                  label: 'Shopping',
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  )),
              BottomNavigationBarItem(
                  label: 'Menu',
                  icon: Icon(
                    Icons.menu,
                  )),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }

  Widget buildFlexibleSpace(BuildContext context, double margin) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.cyan.shade200, Colors.cyan.shade100],
          )),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            child: Container(
              margin: EdgeInsets.only(left: margin),
              child: TextField(
                onTap: () {},
                decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // عشان ال hint text يظهر
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.photo_camera_outlined,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.keyboard_voice,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1)),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    hintText: 'Search Amazon.eg',
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.cyan.shade100,
      collapsedHeight: 50,
      toolbarHeight: 50,
      flexibleSpace: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Deliver to Egypt',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  List _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  viewImages() {}
}
