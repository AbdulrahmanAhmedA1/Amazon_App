import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon/models/product.dart';
import 'package:flutter_amazon/providers/products_provider.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:flutter_amazon/screens/category_screen.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  final List<Widget> list = [
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightGreen.shade200,
          child: Icon(
            Icons.settings,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Today\'s Deals'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Souq orders'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade200,
          child: Icon(
            Icons.card_giftcard_outlined,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Coupons'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightGreen.shade200,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Supermarket'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.pink.shade100,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Fashion'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Models'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.pink.shade50,
          child: Icon(
            Icons.message,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Home'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(
            Icons.message,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Toys'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.pink.shade100,
          child: Icon(
            Icons.message,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Beauty'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightBlueAccent.shade700,
          child: Icon(
            Icons.computer,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Electronics'),
      ],
    ),
    Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.message,
            color: Colors.black54,
          ),
        ),
        Text('COVID-19'),
      ],
    ),
  ];
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  List _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];
  Timer? timer;
  String? imagePath;
  List<Product>? products = [];

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController!);
    changeImage();
  }

  changeImage() {
    print(_carouselImages.length);
    int index = 0;
    imagePath = _carouselImages[index];
    Timer.periodic(Duration(seconds: 3), (timer) {
      index < _carouselImages.length - 1 ? index++ : index = 0;
      print(index);
      _carouselImages.elementAt(index);
      if (mounted) {
        setState(() {
          imagePath = _carouselImages[index];
        });
      }
    });
  }

  List _brandImages = [
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/dell.jpg',
    'assets/images/h&m.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/huawei.jpg',
  ];
  final List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath': 'assets/images/CatClothes.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/images/CatShoes.jpg',
    },
    {
      'categoryName': 'Beauty&Health',
      'categoryImagesPath': 'assets/images/CatBeauty.jpg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath': 'assets/images/CatFurniture.jpg',
    },
    {
      'categoryName': 'Watches',
      'categoryImagesPath': 'assets/images/CatWatches.jpg',
    },
  ];
  List phoneImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpy4FfhiA-0gzbaGbSA4wtNG_nFFqU5yRX4Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHV9AcJZxWJfTsYPuwazmqcctqsBT3KbwO-w&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS3Gi1eUPn_ET2MOOZtC7CeGUhbj_ISA8RgS5fm0Ei6Vg0S3rA_CBpUfqYEgNMognvrGU&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlWzB4zr8XnjzcfKLjxT-GBwb3K-HOyowecA&usqp=CAU',
    'https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/6186cnZIdoL._AC_SL1000_.jpg',
    'https://m.media-amazon.com/images/I/71cSV-RTBSL.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdJA9Iv0UWHICNO9xGpk5dumb6ODiEO8Pc-A&usqp=CAU',
  ];
  List clothesImages = [
    'https://m.media-amazon.com/images/I/71g7tHQt-sL._AC_UL320_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPKNl8tp9Qian8oyTEFIb9fTbFizMxofJ4wg&usqp=CAU',
    'https://images-na.ssl-images-amazon.com/images/I/71KVPm5KJdL._AC_UX500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61jvFw72OVL._AC_UX466_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51KMhoElQcL._AC_UX466_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71lKAfQDUoL._AC_UX466_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRajMwUhRXaB-5DPfy-GuR6Dd3DNR3Fk-XEfQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkWOq2SHoFIJAN9s3qxUHSv_EwplR5mBWXGg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkRmeZCrzhi5L0p2GH4HvRyhO6mpqLovQJTw&usqp=CAU',
  ];
  List beautyImages = [
    'https://images-na.ssl-images-amazon.com/images/I/61dwB-2X-6L._SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/81w9cll2RmL._SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61RkTTLRnNL._SL1134_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/619pgKveCdL._SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61EsS5sSaCL._SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71e7ksQ-xyL._AC_SL1500_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-msrXn-FYxPCWVrEKgrnL2ndgPTPGj9ZSqg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScmeCa_rPF_3fQm2AXlPiei8wYpwrqCBfCdA&usqp=CAU',
    'https://images-na.ssl-images-amazon.com/images/I/71E6h0kl3ZL._SL1500_.jpg',
  ];
  List laptopsImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKCboToZY9YewFGg0GuINZoZHqXnONYksb4q4ZoaCxKMjGEsRyJeltDO5YW9k7rku-CQw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzMcbT446oAURFzCNHBu8l02i7kiwVxgCPGyZSPwgEO6QihAyxy8ckPwz7mZWvxHbJkPY&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlBYUkGQX5iaP4pLQP-BMD3S-N1WOiLnw0nhaoxrL4zumw4-drIM2D80LJOZHq-WkkVbU&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0sTJn0VbAjFMC1BCU0uhPhxjJIyyfhPqNvg&usqp=CAU',
    'https://images-na.ssl-images-amazon.com/images/I/41OfZx5ex3L._AC_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXg7fC_QU9SrgINavn5V8LEyC9sJqMyXn4dQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtoxAN6Xayav_KOU-Zy64AwwVz8KFBLXIdKg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAckoOfwa1p3xqpcylJT3R9UJrrz-pRxse8z0G-xp6lcm6nycKY1rjYxg0q1OMKlmTe1U&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOGBa6dNJVi_ryROna8uO5SsuBO87RDo3C9sD1vgchHb0d1qDJE9C7YmBDl92lKAzwv0E&usqp=CAU',
  ];

  List furnitureImages = [
    'https://images-na.ssl-images-amazon.com/images/I/71P-p2sj6eL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71xytsyiHzL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/81sBT3voCPL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71Rj3InxQlL._SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/81KabJxRvDL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/81khjDZg5xL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/716-fllmUCL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71QxxtRFFkL._AC_SL1232_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNJxYJNzfp1ZJIRLrvozhrg4uLWmlPFjCbVg&usqp=CAU',
  ];
  List watchesImages = [
    'https://images-na.ssl-images-amazon.com/images/I/71vCuRn4CkL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51EWl3XsiYL._AC_SL1000_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51bSW9gjoaL._AC_SL1024_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51r2LCE3FLL._AC_SL1000_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61MVdCYfbOL._AC_UX679_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91M50AHRTKL._AC_UX569_.jp',
    'https://images-na.ssl-images-amazon.com/images/I/71bf9IpGjtL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71JtUMDeBBL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61gCtkVYb5L._AC_SL1000_.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var provider2 = Provider.of<Provider2>(context, listen: false);
    var provider1 = Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.teal.shade400, Colors.teal.shade200],
            )),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintStyle: TextStyle(fontSize: 20),
                      hintText: 'Search Amazon.eg',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
          ),
        ],
      )),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * .1,
                maxHeight: MediaQuery.of(context).size.height * .13,
              ),
              color: Colors.white,
              child: ListView.builder(
                  itemCount: widget.list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: widget.list[index]);
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .32,
                    width: double.infinity,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(offset: Offset(2.0, 2.0), blurRadius: 2.0)
                    ]),
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.fill,
                    ),
                    // Carousel(
                    //   indicatorBgPadding: 0,
                    //   dotSize: 0,
                    //   images: [
                    //     Image.asset(_carouselImages[0], fit: BoxFit.fill),
                    //     Image.asset(_carouselImages[1], fit: BoxFit.fill),
                    //     Image.asset(_carouselImages[2], fit: BoxFit.fill),
                    //     Image.asset(_carouselImages[3], fit: BoxFit.fill),
                    //   ],
                    // ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            (.32 * (7 / 8)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height * .28,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    CategoryScreen.route,
                                    arguments: categories[index]['categoryName']
                                        .toString());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                margin: EdgeInsets.only(right: 10),
                                width: 160,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 5,
                                          right: 7),
                                      child: Text(
                                          'Up to 50% off ${categories[index]['categoryName'].toString()}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade100,
                                                offset: Offset(1.0, 1.0),
                                                blurRadius: 1.0)
                                          ]),
                                          child: Image.asset(
                                            categories[index]
                                                    ['categoryImagesPath']
                                                .toString(),
                                            fit: BoxFit.fill,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: categories.length,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            videosContainer(context),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
              context,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsnebGe6wQbzFeSgbD4ic2GjtNsQXXfujHFQ&usqp=CAU',
              'Phones Shop',
              Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),

            SizedBox(
              height: 5,
            ),
            GestureDetector(
              child: Stack(
                children: [
                  Container(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmwl4k0BZubbCZD7R2BwO15qGdrwLLKG5Ig&usqp=CAU',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * .25,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Up to 40% off',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          'Shoes',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
                context,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNNfDnhmAnvWIATaP_n7QE7Lx7OJGqq3brL7I_xdJaYL20R_4BjL4wx_VJhNtgR0Tw3js&usqp=CAU',
                'Women\'s footwear',
                Colors.black),
            gridView(context, phoneImages, 'Phones'),
            buildWidthWidget(
                context,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKEA651dNIq_hLAYlx1yTojUqucXFdA1Ig5Q&usqp=CAU',
                'Tredmills',
                Colors.black),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
              context,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKOKk6YXlLGn3YLduWyurtlibfXwG6nv6Ppw&usqp=CAU',
              'Furniture',
              Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
              context,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTokWbYXeIcnR9hCMwtoICJBLquKpvLVdHE9g&usqp=CAU',
              'Bags',
              Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            textWImage(
                'https://cdn.al-ain.com/images/2020/10/06/127-234238-amr-diab-beauties_700x400.jpg',
                '34 By Amr Diab | Amazon Exclusive'),
            SizedBox(
              height: 5,
            ),
            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQYoRSw8IQfHooiJlbxMXLH70_zcBSb2zcw&usqp=CAU',
                'Women\'s watches | Up to 40% of'),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
              context,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQxF7Gmfn6MNGcxjLG0cEPwcP_su9nBvEKKQ&usqp=CAU',
              'Kids Clothing',
              Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBRGBQA_OGEH9jCZDntD633Flf6XDZ5bV2aQ&usqp=CAU',
                'Shop Speakers'),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
              context,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0PLFTrAx0yL1ZmH9vQViLnjzohQ6rBWgwNw&usqp=CAU',
              'Cameras',
              Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
                context,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXzXOcssN_twaOaQdiIYrDZqksqexhFbwvkQ&usqp=CAU',
                'Men\'s apparel',
                Colors.black),
            gridView(context, clothesImages, 'Clothes'),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 3,
            ),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT49arWUC2p7yqYt7K9ao2_weaxczRtiW6d6g&usqp=CAU',
                'Up to 20% off Men\'s Accessories'),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              child: Stack(
                children: [
                  Container(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL7QZNZ4_8PevZ1NwzEPlfIDi2T-QZRLS-kQ&usqp=CAU',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * .25,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Sports Wear',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            gridView(context, beautyImages, 'Beauty'),

            smallGridView(context),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              color: Colors.white,
              height: 325,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s Deals',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/shoes.jpeg'),
                    title: Row(
                      children: [
                        Text(
                          'EGP459.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'EGP619.25',
                          style: TextStyle(
                              decorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey[500],
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/shoes.jpeg'),
                    title: Row(
                      children: [
                        Text(
                          'EGP459.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'EGP619.25',
                          style: TextStyle(
                              decorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey[500],
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/shoes.jpeg'),
                    title: Row(
                      children: [
                        Text(
                          'EGP459.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'EGP619.25',
                          style: TextStyle(
                              decorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey[500],
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all deals',
                        style: TextStyle(color: Colors.teal[300], fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            textWImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5UzhhQ0wt1rkpFaXwbUbvN4VdDpQl0hA2fQ&usqp=CAU',
              'Kitchen Accessories | Up to 50% off',
            ),
            SizedBox(
              height: 5,
            ),

            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0hl6VEujYv79UVHxdpRU17piZoRBt3CXv8w&usqp=CAU',
                'Women\'s Accessories | Up to 30% off'),
            SizedBox(
              height: 5,
            ),

            textWImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8HaxQHQvlZ2UVOu4sqEx0TlVqFw5RvkmAGg&usqp=CAU',
              'Up to 30% off Large Appliances',
            ),
            SizedBox(
              height: 5,
            ),

            textWImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPlIv-XjsyGGQUlQISUfOyLtT7Ej0Rem9oAw&usqp=CAU',
              'Up to 60% Car Care Products',
            ),
            SizedBox(
              height: 5,
            ),

            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),

            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyRvY-leWoBFqMQMWWoh57AIbXEB0tBFWL0Q&usqp=CAU',
                'Musical Instruments'),
            SizedBox(
              height: 5,
            ),

            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),

            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA2ZWbK3nxE63DHC3pQKzOzYVlo7rFrwWITQ&usqp=CAU',
                'Summer Essentials'),
            gridView(context, laptopsImages, 'Laptops'),

            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),
            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz_i1V2fuEzBWlXz8TRn7n3eox1hD2l9-H_g&usqp=CAU',
                'Perfune Sets | Up to 60% off'),

            gridView(context, furnitureImages, 'Furniture'),

            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            // textWImage('', ''),
            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            smallGridView(context),

            gridView(context, watchesImages, 'Watches'),
            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQglsve8y_nPAIkhWk6s9M1aywnIUevqxjEw&usqp=CAU',
                'Capture every moment'),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            textWImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGRM9_-u8Qhsj6MlTISXSqiV1OUS5VW6I4Aw&usqp=CAU',
                'Beauty Tools | Up to 40% off'),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            buildWidthWidget(
                context,
                'https://www.xmg.gg/wp-content/uploads/background_fusion-15-1920x1080.jpg',
                ' Laptops Shop',
                Colors.white),
            SizedBox(
              height: 5,
            ),
            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            smallGridView(context),
            SizedBox(
              height: 5,
            ),

            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .1,
                    color: Colors.black87,
                    child: Divider(
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'You\'ve reached the end. Keep exploring!',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .1,
                    color: Colors.black87,
                    child: Divider(
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            bigGridView(context),
          ])),
        ],
      ),
      bottomNavigationBar: provider2.buildBottomNavigationBar(context),
    );
  }

  GestureDetector buildWidthWidget(
      BuildContext context, String imageUrl, String title, Color textColor) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .25,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget textWImage(String imageUrl, text) {
  return Container(
    // margin: EdgeInsets.symmetric(vertical: 5),
    height: 350,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bigGridView(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore More',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 6,
            runSpacing: 12,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .11,
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://images-na.ssl-images-amazon.com/images/I/71e7ksQ-xyL._AC_SL1500_.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Beauty',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .11,
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxrHz9SDVYdPiANhqslrcJAczUZ0UPqc0SxA&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Books',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .11,
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdER-sSVnIOJmqUeOYpqt-_RAmzbKJfW9GEA&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Fashion',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .11,
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSs9_eROPTPw7Ws5iHUQF3BQ9oXMRO4Ldc1g&usqp=CAU',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Headsets',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .11,
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvVP6YfhkR5RrQq_yYjgLiP4nOuMe2fuJZFA&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Fitness & Outdoor',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .11,
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROo0tD44NJnogFQqLQQnhH1QKyCinm0dR5qg&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Tablets',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'All Categories',
                style: TextStyle(color: Colors.teal[200], fontSize: 18),
              )),
        ],
      ),
    ),
  );
}

Widget smallGridView(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kindle',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 5,
            runSpacing: 10,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * .22,
                    width: MediaQuery.of(context).size.width * .45,
                    color: Colors.grey.shade100,
                    child: Image.network(
                      'https://m.media-amazon.com/images/I/41LETbO4zqL._AC_SY1000_.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'All-New Kindle',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * .22,
                    width: MediaQuery.of(context).size.width * .45,
                    color: Colors.grey.shade100,
                    child: Image.network(
                      'https://m.media-amazon.com/images/I/41LETbO4zqL._AC_SY1000_.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'All-New Kindle',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * .22,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://m.media-amazon.com/images/I/41LETbO4zqL._AC_SY1000_.jpg',
                      fit: BoxFit.contain,
                    ),
                    color: Colors.grey.shade100,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'All-New Kindle',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * .22,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.network(
                      'https://m.media-amazon.com/images/I/41LETbO4zqL._AC_SY1000_.jpg',
                      fit: BoxFit.contain,
                    ),
                    color: Colors.grey.shade100,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'All-New Kindle',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'See More',
                style: TextStyle(color: Colors.teal[200], fontSize: 18),
              )),
        ],
      ),
    ),
  );
}

Widget videosContainer(BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        child: Column(
          children: [
            Text(
              'Shopping on Amazon is easy, Watch to learn more',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_forward_outlined),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 50))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Image.asset(
                                  'assets/images/video1.jpg',
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'How to create an account?',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Image.asset(
                                  'assets/images/video1.jpg',
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'How to place an order?',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget gridView(BuildContext context, List images, String categoryName) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 7),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              categoryName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: [
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[0].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[1].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[2].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[3].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[4].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[5].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[6].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[7].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width * .3,
                  height: 110,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.network(
                      images[8].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Explore more',
                    style: TextStyle(color: Colors.teal[200], fontSize: 18),
                  ))),
        ],
      ),
    ),
  );
}

/*
    List<Product> _products = [
    Product(
        id: 'Samsung1',
        title: 'Samsung Galaxy S9',
        description:
            'Samsung Galaxy S9 G960U 64GB Unlocked GSM 4G LTE Phone w/ 12MP Camera - Midnight Black',
        price: 50.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
        brand: 'Samsung',
        productCategoryName: 'Phones',
        quantity: 65,
        isPopular: false),
    Product(
        id: 'Samsung Galaxy A10s',
        title: 'Samsung Galaxy A10s',
        description:
            'Samsung Galaxy A10s A107M - 32GB, 6.2" HD+ Infinity-V Display, 13MP+2MP Dual Rear +8MP Front Cameras, GSM Unlocked Smartphone - Blue.',
        price: 50.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/51ME-ADMjRL._AC_SL1000_.jpg',
        brand: 'Samsung ',
        productCategoryName: 'Phones',
        quantity: 1002,
        isPopular: false),
    Product(
        id: 'Samsung Galaxy A51',
        title: 'Samsung Galaxy A51',
        description:
            'Samsung Galaxy A51 (128GB, 4GB) 6.5", 48MP Quad Camera, Dual SIM GSM Unlocked A515F/DS- Global 4G LTE International Model - Prism Crush Blue.',
        price: 50.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg',
        brand: 'Samsung',
        productCategoryName: 'Phones',
        quantity: 6423,
        isPopular: true),
    Product(
        id: 'Huawei P40 Pro',
        title: 'Huawei P40 Pro',
        description:
            'Huawei P40 Pro (5G) ELS-NX9 Dual/Hybrid-SIM 256GB (GSM Only | No CDMA) Factory Unlocked Smartphone (Silver Frost) - International Version',
        price: 900.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/6186cnZIdoL._AC_SL1000_.jpg',
        brand: 'Huawei',
        productCategoryName: 'Phones',
        quantity: 3,
        isPopular: true),
    Product(
        id: 'iPhone 12 Pro',
        title: 'iPhone 12 Pro',
        description:
            'New Apple iPhone 12 Pro (512GB, Gold) [Locked] + Carrier Subscription',
        price: 1100,
        imageUrl: 'https://m.media-amazon.com/images/I/71cSV-RTBSL.jpg',
        brand: 'Apple',
        productCategoryName: 'Phones',
        quantity: 3,
        isPopular: true),
    Product(
        id: 'iPhone 12 Pro Max ',
        title: 'iPhone 12 Pro Max ',
        description:
            'New Apple iPhone 12 Pro Max (128GB, Graphite) [Locked] + Carrier Subscription',
        price: 50.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/71XXJC7V8tL._FMwebp__.jpg',
        brand: 'Apple',
        productCategoryName: 'Phones',
        quantity: 2654,
        isPopular: false),
    Product(
        id: 'Hanes Mens ',
        title: 'Long Sleeve Beefy Henley Shirt',
        description: 'Hanes Men\'s Long Sleeve Beefy Henley Shirt ',
        price: 22.30,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/91YHIgoKb4L._AC_UX425_.jpg',
        brand: 'No brand',
        productCategoryName: 'Clothes',
        quantity: 58466,
        isPopular: true),
    Product(
        id: 'Weave Jogger',
        title: 'Weave Jogger',
        description: 'Champion Mens Reverse Weave Jogger',
        price: 58.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/71g7tHQt-sL._AC_UL320_.jpg',
        brand: 'H&M',
        productCategoryName: 'Clothes',
        quantity: 84894,
        isPopular: false),
    Product(
        id: 'Adeliber Dresses for Womens',
        title: 'Adeliber Dresses for Womens',
        description:
            'Adeliber Dresses for Womens, Sexy Solid Sequined Stitching Shining Club Sheath Long Sleeved Mini Dress',
        price: 50.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/7177o9jITiL._AC_UX466_.jpg',
        brand: 'H&M',
        productCategoryName: 'Clothes',
        quantity: 49847,
        isPopular: true),
    Product(
        id: 'Tanjun Sneakers',
        title: 'Tanjun Sneakers',
        description:
            'NIKE Men\'s Tanjun Sneakers, Breathable Textile Uppers and Comfortable Lightweight Cushioning ',
        price: 191.89,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71KVPm5KJdL._AC_UX500_.jpg',
        brand: 'Nike',
        productCategoryName: 'Shoes',
        quantity: 65489,
        isPopular: false),
    Product(
        id: 'Training Pant Female',
        title: 'Training Pant Female',
        description: 'Nike Epic Training Pant Female ',
        price: 189.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61jvFw72OVL._AC_UX466_.jpg',
        brand: 'Nike',
        productCategoryName: 'Clothes',
        quantity: 89741,
        isPopular: false),
    Product(
        id: 'Trefoil Tee',
        title: 'Trefoil Tee',
        description: 'Originals Women\'s Trefoil Tee ',
        price: 88.88,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/51KMhoElQcL._AC_UX466_.jpg',
        brand: 'Addidas',
        productCategoryName: 'Clothes',
        quantity: 8941,
        isPopular: true),
    Product(
        id: 'Long SleeveWoman',
        title: 'Long Sleeve woman',
        description: ' Boys\' Long Sleeve Cotton Jersey Hooded T-Shirt Tee',
        price: 68.29,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71lKAfQDUoL._AC_UX466_.jpg',
        brand: 'Addidas',
        productCategoryName: 'Clothes',
        quantity: 3,
        isPopular: false),
    Product(
        id: 'Eye Cream for Wrinkles',
        title: 'Eye Cream for Wrinkles',
        description:
            'Olay Ultimate Eye Cream for Wrinkles, Puffy Eyes + Dark Circles, 0.4 fl oz',
        price: 54.98,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61dwB-2X-6L._SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Beauty & health',
        quantity: 8515,
        isPopular: false),
    Product(
        id: 'Mango Body Yogurt',
        title: 'Mango Body Yogurt',
        description:
            'The Body Shop Mango Body Yogurt, 48hr Moisturizer, 100% Vegan, 6.98 Fl.Oz',
        price: 80.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81w9cll2RmL._SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Beauty & health',
        quantity: 3,
        isPopular: false),
    Product(
        id: 'Food Intensive Skin',
        title: 'Food Intensive Skin',
        description:
            'Weleda Skin Food Intensive Skin Nourishment Body Butter, 5 Fl Oz',
        price: 50.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71E6h0kl3ZL._SL1500_.jpg',
        brand: 'No Brand',
        productCategoryName: 'Beauty & health',
        quantity: 38425,
        isPopular: true),
    Product(
        id: 'Ultra Shea Body Cream',
        title: 'Ultra Shea Body Cream',
        description:
            'Bath and Body Works IN THE STARS Ultra Shea Body Cream (Limited Edition) 8 Ounce ',
        price: 14,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61RkTTLRnNL._SL1134_.jpg',
        brand: '',
        productCategoryName: 'Beauty & health',
        quantity: 384,
        isPopular: false),
    Product(
        id: 'Soft Moisturizing Crème',
        title: 'Soft Moisturizing Crème',
        description:
            'NIVEA Soft Moisturizing Crème- Pack of 3, All-In-One Cream For Body, Face and Dry Hands - Use After Hand Washing - 6.8 oz. Jars',
        price: 50.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/619pgKveCdL._SL1500_.jpg',
        brand: 'No Brand',
        productCategoryName: 'Beauty & health',
        quantity: 45,
        isPopular: true),
    Product(
        id: 'Body Cream Cocoa Butter',
        title: 'Body Cream Cocoa Butter',
        description: 'NIVEA Cocoa Butter Body Cream 15.5 Oz',
        price: 84.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61EsS5sSaCL._SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Beauty & health',
        quantity: 98432,
        isPopular: true),
    Product(
        id: 'Skin Repair Body Lotion',
        title: 'Skin Repair Body Lotion',
        description:
            'O\'Keeffe\'s Skin Repair Body Lotion and Dry Skin Moisturizer, Pump Bottle, 12 ounce, Packaging May Vary',
        price: 890.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71e7ksQ-xyL._AC_SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Beauty & health',
        quantity: 3811,
        isPopular: false),
    Product(
        id: '15 5000 Laptop',
        title: '15 5000 Laptop',
        description:
            'Dell Inspiron 15 5000 Laptop Computer: Core i7-8550U, 128GB SSD + 1TB HDD, 8GB RAM, 15.6-inch Full HD Display, Backlit Keyboard, Windows 10 ',
        price: 630.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/31ZSymDl-YL._AC_.jpg',
        brand: 'Dell',
        productCategoryName: 'Laptops',
        quantity: 325,
        isPopular: true),
    Product(
        id: 'Business Laptop',
        title: 'Business Laptop',
        description:
            'Latest Dell Vostro 14 5490 Business Laptop 14.0-Inch FHD 10th Gen Intel Core i7-10510U Up to 4.9 GHz 16GB DDR4 RAM 512GB M.2 PCIe SSD GeForce MX250 2GB GDDR5 GPU Fingerprint Reader Type-C Win10 Pro ',
        price: 1220.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71W690nu%2BXL._AC_SL1500_.jpg',
        brand: 'Dell',
        productCategoryName: 'Laptops',
        quantity: 81,
        isPopular: true),
    Product(
        id: 'Latitude 5411 14" Notebook',
        title: 'Latitude 5411 14" Notebook',
        description:
            'Latitude 5411 14" Notebook - Full HD - 1920 x 1080 - Core i7 i7-10850H 10th Gen 2.7GHz Hexa-core (6 Core) - 16GB RAM - 256GB SSD',
        price: 1220.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/41OfZx5ex3L._AC_.jpg',
        brand: 'Dell',
        productCategoryName: 'Laptops',
        quantity: 815,
        isPopular: false),
    Product(
        id: 'New Apple MacBook Pro with Apple',
        title: 'New Apple MacBook Pro with Apple',
        description:
            'New Apple MacBook Pro with Apple M1 Chip (13-inch, 8GB RAM, 256GB SSD Storage) - Space Gray (Latest Model)',
        price: 800.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71an9eiBxpL._AC_SL1500_.jpg',
        brand: 'Apple',
        productCategoryName: 'Laptops',
        quantity: 885,
        isPopular: true),
    Product(
        id: 'Apple MacBook Air',
        title: 'Apple MacBook Air',
        description:
            'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 16GB Memory, 256GB SSD, Space Gray (Early 2020)',
        price: 1220.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61wLbRLshAL._AC_SL1200_.jpg',
        brand: 'Apple',
        productCategoryName: 'Laptops',
        quantity: 815,
        isPopular: true),
    Product(
        id: 'Apple MacBook Progag',
        title: 'Apple MacBook Pro',
        description:
            'Apple MacBook Pro MF839LL/A 13.3in Laptop, Intel Core i5 2.7 GHz, 8GB Ram, 128GB SSD ',
        price: 700.89,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/315CQ1KmlwL._AC_.jpg',
        brand: 'Apple',
        productCategoryName: 'Laptops',
        quantity: 815,
        isPopular: false),
    Product(
        id: 'Apple MacBook Air',
        title: 'Apple MacBook Air',
        description:
            'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 8GB Memory, 256GB SSD, Silver (Early 2020)',
        price: 780.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61QRQHn0jJL._AC_SL1200_.jpg',
        brand: 'Apple',
        productCategoryName: 'Laptops',
        quantity: 4455,
        isPopular: true),
    Product(
        id: 'Apple 16 MacBook Pro',
        title: 'Apple 16 MacBook Pro',
        description:
            'Apple 16 MacBook Pro with Touch Bar, 9th-Gen 8-Core Intel i9 2.3GHz, 16GB RAM, 1TB SSD, AMD Radeon Pro 5500M 8GB, Space Gray, Late 2019 Z0Y0005J7 / Z0Y00006M',
        price: 800.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61qNHbx9LDL._AC_SL1200_.jpg',
        brand: 'Apple',
        productCategoryName: 'Laptops',
        quantity: 885,
        isPopular: false),
    Product(
        id: 'Sofa Setttt',
        title: 'Sofa Set',
        description: 'Beverly Fine Funiture Sectional Sofa Set, 91A Black ',
        price: 650.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71P-p2sj6eL._AC_SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 91,
        isPopular: true),
    Product(
        id: 'Furniture Classroom with Teacher\'s',
        title: 'Furniture Classroom with Teacher\'s',
        description:
            'L.O.L. Surprise! Furniture Classroom with Teacher\'s Pet & 10+ Surprises',
        price: 120.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71xytsyiHzL._AC_SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 815,
        isPopular: false),
    Product(
        id: 'Sofa Couch for Two People',
        title: 'Sofa Couch for Two People',
        description:
            'Serta Copenhagen Sofa Couch for Two People, Pillowed Back Cushions and Rounded Arms, Durable Modern Upholstered Fabric, 61" Loveseat, Brown',
        price: 1220.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81sBT3voCPL._AC_SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 8100,
        isPopular: true),
    Product(
        id: 'Delta Children Plastic Toddler Bed',
        title: 'Delta Children Plastic Toddler Bed',
        description:
            'Delta Children Plastic Toddler Bed, Disney Princess + Delta Children Twinkle Galaxy Dual Sided Recycled Fiber Core Toddler Mattress (Bundle)',
        price: 127.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71Rj3InxQlL._SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 9145,
        isPopular: false),
    Product(
        id: 'Outdoor Patio ',
        title: 'Outdoor Patio ',
        description:
            'Recaceik 3 Pieces Outdoor Patio Furniture Sets Rattan Chair Wicker Set, with Cushions and Tempered Glass Tabletop, Outdoor Indoor Use Backyard Porch Garden-(Brown)',
        price: 1224.88,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81KabJxRvDL._AC_SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 25,
        isPopular: true),
    Product(
        id: 'Flash Furniture Nantucket 6 Piece',
        title: 'Flash Furniture Nantucket 6 Piece',
        description:
            'Flash Furniture Nantucket 6 Piece Black Patio Garden Set with Table, Umbrella and 4 Folding Chairs',
        price: 1220.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81khjDZg5xL._AC_SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 651,
        isPopular: false),
    Product(
        id: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
        title: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
        description:
            'Homall 4 Pieces Patio Outdoor Furniture Sets, All Weather PE Rattan Wicker Sectional Sofa Modern Manual Conversation Sets with Cushions and Glass Table for Lawn Backyard Garden Poolside（Beige）',
        price: 1220.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/716-fllmUCL._AC_SL1500_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 594,
        isPopular: true),
    Product(
        id: 'Ashley Furniture Signature Design',
        title: 'Ashley Furniture Signature Design',
        description:
            'Ashley Furniture Signature Design - Dolante Upholstered Bed - Queen Size - Complete Bed Set in a Box - Contemporary Style Checker - Gray',
        price: 300.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71QxxtRFFkL._AC_SL1232_.jpg',
        brand: 'No brand',
        productCategoryName: 'Furniture',
        quantity: 78,
        isPopular: false),
    Product(
        id: 'Apple Watch Series 3',
        title: 'Apple Watch Series 3',
        description:
            'Apple Watch Series 3 (GPS, 38mm) - Silver Aluminum Case with White Sport Band',
        price: 100.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71vCuRn4CkL._AC_SL1500_.jpg',
        brand: 'Apple',
        productCategoryName: 'Watches',
        quantity: 156,
        isPopular: true),
    Product(
        id: 'Garmin Forerunner 45S',
        title: 'Garmin Forerunner 45S',
        description:
            'Garmin Forerunner 45S, 39mm Easy-to-use GPS Running Watch with Coach Free Training Plan Support, Purple',
        price: 86.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/51EWl3XsiYL._AC_SL1000_.jpg',
        brand: 'No brand',
        productCategoryName: 'Watches',
        quantity: 142,
        isPopular: false),
    Product(
        id: 'Samsung Galaxy Watch Active 2',
        title: 'Samsung Galaxy Watch Active 2',
        description:
            'Samsung Galaxy Watch Active 2 (40mm, GPS, Bluetooth) Smart Watch with Advanced Health Monitoring, Fitness Tracking , and Long Lasting Battery - Silver (US Version)',
        price: 300.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/51bSW9gjoaL._AC_SL1024_.jpg',
        brand: 'Samsung',
        productCategoryName: 'Watches',
        quantity: 167,
        isPopular: false),
    Product(
        id: 'Garmin vivoactive 4S',
        title: 'Garmin vivoactive 4S',
        description:
            'Garmin vivoactive 4S, Smaller-Sized GPS Smartwatch, Features Music, Body Energy Monitoring, Animated Workouts, Pulse Ox Sensors, Rose Gold with White Band',
        price: 40.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/51r2LCE3FLL._AC_SL1000_.jpg',
        brand: 'No brand',
        productCategoryName: 'Watches',
        quantity: 659,
        isPopular: false),
    Product(
        id: 'Patek Philippe World',
        title: 'Patek Philippe World',
        description: 'Patek Philippe World Time Men\'s Watch Model 5131/1P-001',
        price: 20.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61MVdCYfbOL._AC_UX679_.jpg',
        brand: 'No brand',
        productCategoryName: 'Watches',
        quantity: 98,
        isPopular: false),
    Product(
        id: 'Bell & Ross Men',
        title: 'Bell & Ross Men',
        description:
            'Bell & Ross Men\'s BR-MNUTTOURB-PG Minuteur\' Black Carbon Fiber Dial 18K Rose Gold Tourbillon Watch',
        price: 33.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/91M50AHRTKL._AC_UX569_.jpg',
        brand: 'No brand',
        productCategoryName: 'Watches',
        quantity: 951,
        isPopular: false),
    Product(
        id: 'New Apple Watch Series',
        title: 'New Apple Watch Series',
        description:
            'New Apple Watch Series 6 (GPS, 40mm) - Blue Aluminum Case with Deep Navy Sport Band ',
        price: 400.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71bf9IpGjtL._AC_SL1500_.jpg',
        brand: 'Apple',
        productCategoryName: 'Watches',
        quantity: 951,
        isPopular: false),
    Product(
        id: 'New Apple Watch SE',
        title: 'New Apple Watch SE',
        description:
            'New Apple Watch SE (GPS, 40mm) - Gold Aluminum Case with Pink Sand Sport Band',
        price: 200.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71JtUMDeBBL._AC_SL1500_.jpg',
        brand: 'Apple',
        productCategoryName: 'Watches',
        quantity: 951,
        isPopular: false),
    Product(
        id: 'YAMAY Smart Watch 2020 Ver',
        title: 'YAMAY Smart Watch 2020 Ver',
        description:
            'YAMAY Smart Watch 2020 Ver. Watches for Men Women Fitness Tracker Blood Pressure Monitor Blood Oxygen Meter Heart Rate Monitor IP68 Waterproof, Smartwatch Compatible with iPhone Samsung Android Phones',
        price: 183.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61gCtkVYb5L._AC_SL1000_.jpg',
        brand: 'Apple',
        productCategoryName: 'Watches',
        quantity: 56,
        isPopular: true),
    Product(
        id: 'Samsung Galaxy Watch Active 23',
        title: 'Samsung Galaxy Watch Active ',
        description:
            'Samsung Galaxy Watch Active (40MM, GPS, Bluetooth) Smart Watch with Fitness Tracking, and Sleep Analysis - Rose Gold  (US Version)',
        price: 150.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61n1c2vnPJL._AC_SL1500_.jpg',
        brand: 'Samsung',
        productCategoryName: 'Watches',
        quantity: 78,
        isPopular: true),
    Product(
        id: 'Samsung Galaxy Watch 3',
        title: 'Samsung Galaxy Watch 3',
        description:
            'Samsung Galaxy Watch 3 (41mm, GPS, Bluetooth) Smart Watch with Advanced Health monitoring, Fitness Tracking , and Long lasting Battery - Mystic Silver (US Version)',
        price: 184.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81Iu41zFPwL._AC_SL1500_.jpg',
        brand: 'Samsung',
        productCategoryName: 'Watches',
        quantity: 9598,
        isPopular: true),
    Product(
        id: 'Samsung Galaxy Watch Active2 ',
        title: 'Samsung Galaxy Watch Active2 ',
        description:
            'Samsung Galaxy Watch Active2 (Silicon Strap + Aluminum Bezel) Bluetooth - International (Aqua Black, R820-44mm)',
        price: 120.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/518qjbbuGZL._AC_SL1000_.jpg',
        brand: 'Samsung',
        productCategoryName: 'Watches',
        quantity: 951,
        isPopular: false),
    Product(
        id: 'Huawei Watch 2 Sport Smartwatch',
        title: 'Huawei Watch 2 Sport Smartwatch',
        description:
            'Huawei Watch 2 Sport Smartwatch - Ceramic Bezel - Carbon Black Strap (US Warranty)',
        price: 180.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71yPa1g4gWL._AC_SL1500_.jpg',
        brand: 'Huawei',
        productCategoryName: 'Watches',
        quantity: 951,
        isPopular: true),
  ];
*/
