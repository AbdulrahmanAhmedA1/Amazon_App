import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MenuBody extends StatefulWidget {
  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  bool pressed = false;
  Color color = Colors.black;
  bool settingsTaped = false;
  bool allCategoriesTaped = false;
  bool categoriesTaped = false;
  double wid = 40;

  textField() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        onTap: () {
          // Navigator.of(context)
          //     .pushReplacement(PagesAnimations(page: SearchScreen()));
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green)),
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintStyle: TextStyle(fontSize: 20),
            hintText: 'Search Amazon.eg',
            fillColor: Colors.white,
            filled: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 1500),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.cyan.shade300,
          Colors.teal.shade100,
          Colors.teal.shade50,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            MultiSliver(
              children: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    constraints: BoxConstraints(minHeight: 1500),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          textField(),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    categoriesTaped = !categoriesTaped;
                                  });
                                },
                                child: Text(
                                  'Shop by Category',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          if (categoriesTaped) ...[
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Electronics',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Amazon Fashion',
                                  style: TextStyle(fontSize: 20, color: color),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Beauty',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ] else if (!categoriesTaped)
                            SizedBox(
                              height: allCategoriesTaped ? 30 : 20,
                            ),
                          if (allCategoriesTaped) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Amazon Kindle',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Electronics',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Mobile Phones & Accessories',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Computers & Tablets',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Amazon Fashion',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Home',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Toys',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Books',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Television',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: GestureDetector(
                                child: Text(
                                  'Furniture',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  allCategoriesTaped = !allCategoriesTaped;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 37),
                                child: Row(
                                  children: [
                                    Hero(
                                      tag: 'icon',
                                      child: Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        size: 35,
                                        color: Colors.teal.shade500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'See less',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ] else if (categoriesTaped) ...[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  allCategoriesTaped = !allCategoriesTaped;
                                });
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: Row(
                                        children: [
                                          Hero(
                                            tag: 'icon',
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              size: 35,
                                              color: Colors.teal.shade500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'See all',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              child: Text(
                                'Today\'s Deals',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (settingsTaped) ...[
                            Container(
                              height: MediaQuery.of(context).size.height * .2,
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                      color: Colors.grey),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        settingsTaped = !settingsTaped;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          'Settings',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 37),
                                    child: GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Country & Language',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Hero(
                                                tag: 'addIcon',
                                                child: Image.asset(
                                                  'assets/images/egypt.png',
                                                  fit: BoxFit.cover,
                                                  width: 30,
                                                  height: 25,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 37),
                                    child: GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          'Notifications',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                      color: Colors.grey),
                                ],
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 37),
                                      child: GestureDetector(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Permissions',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 37),
                                      child: GestureDetector(
                                        child: Text(
                                          'Legal & About',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                      color: Colors.grey),
                                ],
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 37),
                                      child: GestureDetector(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Switch accounts',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 37),
                                      child: GestureDetector(
                                        child: Text(
                                          'Sign out',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ] else
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  settingsTaped = !settingsTaped;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Settings',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Hero(
                                        tag: 'addIcon',
                                        child: Image.asset(
                                          'assets/images/egypt.png',
                                          width: 30,
                                          height: 25,
                                          fit: BoxFit.cover,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              child: Text(
                                'Customer Service',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ])),
                  )
                ]))
              ],
            )
          ],
        ),
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
