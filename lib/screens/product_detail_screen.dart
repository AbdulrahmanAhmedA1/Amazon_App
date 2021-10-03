import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon/models/product.dart';
import 'package:flutter_amazon/providers/products_provider.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static final String route = '/ProductDetailsScreen';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Product>? categoryProducts;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider2 = Provider.of<Provider2>(context);
    List args = ModalRoute.of(context)!.settings.arguments as List;
    print(args);
    categoryProducts = Provider.of<ProductsProvider>(context, listen: false)
        .findByCategory(args[1]);
    Product product = Provider.of<ProductsProvider>(context).findById(args[0]);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: provider2.buildFlexibleSpace(
            context, MediaQuery.of(context).size.width * .12),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_outlined),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          provider2.sliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            GestureDetector(
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                          'https://m.media-amazon.com/images/I/41LETbO4zqL._AC_SY1000_.jpg'),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        'International Kindle PaperWhite',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'visit the ${product.productCategoryName} Store',
                        style: TextStyle(color: Colors.teal, fontSize: 15),
                      )),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 17,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 17,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 17,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 17,
                      ),
                      Icon(
                        Icons.star_half,
                        color: Colors.orangeAccent,
                        size: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '1,250',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    child: CarouselSlider(
                      carouselController: CarouselController(),
                      items: categoryProducts!.map((e) {
                        return Container(
                          child: Image.network(product.imageUrl.toString()),
                        );
                      }).toList(),
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * .3,
                          autoPlay: false,
                          initialPage: 1,
                          onPageChanged: (int index, _) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .4),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: categoryProducts!.map((e) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: categoryProducts![currentIndex] == e
                                      ? Colors.grey
                                      : Colors.grey.shade100,
                                  shape: BoxShape.circle,
                                ),
                              );
                            }).toList()),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: MediaQuery.of(context).size.width * .65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.blueAccent.shade700)),
                          child: TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(15)),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'VIEW IN YOUR ROOM',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.share_outlined))),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EGP ${product.price}',
                        style: TextStyle(
                            color: Colors.amber.shade900, fontSize: 18),
                      ),
                      Text(
                        'All prices include VAT.',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .8),
                    child: Text(
                      product.description.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'EGP 21.00 delivery: ',
                        style: TextStyle(color: Colors.teal, fontSize: 15),
                      )),
                  Text((DateFormat.yMMMd().format(DateTime.now())).toString()),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Details',
                        style: TextStyle(color: Colors.teal, fontSize: 15),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Deliver to Egypt',
                        style: TextStyle(color: Colors.teal, fontSize: 15),
                      )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'In Stock',
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              width: 200,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey.shade300))),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade200)),
                    child: Row(
                      children: [
                        Text(
                          'Qty: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '1',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300))),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow.shade800)),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300))),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Text(
                    'Sold by',
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '${product.productCategoryName}',
                        style: TextStyle(color: Colors.teal, fontSize: 15),
                      )),
                  Container(
                    child: Text(
                      'and Delivered by Amazon',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'ADD To LIST',
                    style: TextStyle(color: Colors.teal),
                  )),
            ),
            Divider(
              height: 5,
              color: Colors.grey.shade300,
              thickness: 6,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .15,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Icon(
                          Icons.shopping_cart_rounded,
                          size: 35,
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                              constraints: BoxConstraints(maxWidth: 100),
                              child: Text(
                                'Delivered by Amazon',
                                style: TextStyle(color: Colors.teal),
                              )))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Icon(
                          Icons.lock,
                          size: 35,
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                              constraints: BoxConstraints(maxWidth: 100),
                              child: Text(
                                'Secure transaction',
                                style: TextStyle(color: Colors.teal),
                              )))
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              color: Colors.grey.shade300,
              thickness: 6,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 1,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sell on Amazon',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.black,
                          ),
                        ],
                      )),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              color: Colors.grey.shade300,
              thickness: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'Product Image Gallery',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              color: Colors.grey.shade100,
              margin: EdgeInsets.only(left: 15, top: 10),
              padding: EdgeInsets.all(20),
              child: Image.network(product.imageUrl!),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              color: Colors.grey.shade100,
              margin: EdgeInsets.only(left: 15, top: 10),
              padding: EdgeInsets.all(20),
              child: Image.network(product.imageUrl!),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              color: Colors.grey.shade100,
              margin: EdgeInsets.only(left: 15, top: 10),
              padding: EdgeInsets.all(20),
              child: Image.network(product.imageUrl!),
            ),
            Divider(
              height: 5,
              color: Colors.grey.shade300,
              thickness: 6,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Have a question?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Find answers in product info, Q&A, reviews'),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Type your question keyword',
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder()),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, top: 15, bottom: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer reviews',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade900,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade900,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade900,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade900,
                                    ),
                                    Icon(
                                      Icons.star_half,
                                      color: Colors.yellow.shade900,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '2.8 out of 5',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                '5 customers ratings',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.teal,
                              ),
                              onPressed: () {})
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
      bottomNavigationBar: provider2.buildBottomNavigationBar(context),
    );
  }
}
