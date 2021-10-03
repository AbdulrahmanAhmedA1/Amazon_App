import 'package:flutter/material.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static final String route = '/UserScreen';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    var provider2 = Provider.of<Provider2>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(),
              ],
              gradient: LinearGradient(
                colors: [Colors.cyan.shade200, Colors.cyan.shade100],
              )),
        ),
        title: Text(
          'amazon.eg',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   automaticallyImplyLeading: false,
          //   flexibleSpace: Container(
          //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //       BoxShadow(
          //         color: Colors.cyan.shade400,
          //         blurRadius: 100.0,
          //         offset: Offset(2.0, 2.0),
          //       )
          //     ]),
          //   ),
          // ),
          SliverList(
              delegate: SliverChildListDelegate([
            // SliverAppBar(
            //     flexibleSpace: Container(
            //         decoration: BoxDecoration(color: Colors.white, boxShadow: [
            //   BoxShadow(
            //     color: Colors.cyan.shade400,
            //     blurRadius: 100.0,
            //     offset: Offset(2.0, 2.0),
            //   )
            // ]))),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // margin: EdgeInsets.symmetric(horizontal: 15),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good afternoon',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Abdulrahman',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.white,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person_outline_rounded,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Wrap(
                        runSpacing: 10,
                        children: [
                          buildFirstContainer('Your Orders'),
                          buildFirstContainer('Buy Again'),
                          buildFirstContainer('Your Account'),
                          buildFirstContainer('Your Lists'),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      height: 3,
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildSecondContainer(
                      'Your Orders',
                      'hi, you have not recent orders.',
                      'Return to the homepage',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildSecondContainer(
                      'Your Lists',
                      'hi, you have not created any Lists.',
                      'Create a list',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      height: 3,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Account',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Center(
                                      child: Text(
                                    'Gift Cards',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Center(
                                      child: Text(
                                    'Payment options',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    'Your Addresses ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'View your account',
                                style:
                                    TextStyle(color: Colors.teal, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      height: 8,
                      thickness: 8,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildSecondContainer(
                        'Buy Again',
                        'See what orders are recording on Buy Again',
                        'Visit Buy Again'),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ]))
        ],
      ),
      bottomNavigationBar: provider2.buildBottomNavigationBar(context),
    );
  }

  Widget buildFirstContainer(text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      width: MediaQuery.of(context).size.width * .44,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(28),
        color: Colors.grey.shade100,
      ),
    );
  }

  Widget buildSecondContainer(
      String title, String description, String textButton) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {},
            child: Container(
              height: 50,
              child: Center(
                  child: Text(
                textButton,
                style: TextStyle(fontSize: 18),
              )),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(28),
                color: Colors.grey.shade100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
