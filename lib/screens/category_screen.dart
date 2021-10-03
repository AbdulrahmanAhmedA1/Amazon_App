import 'package:flutter/material.dart';
import 'package:flutter_amazon/models/product.dart';
import 'package:flutter_amazon/providers/products_provider.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:flutter_amazon/screens/product_detail_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  static final String route = '/CategoryScreen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product>? categoryProducts;
  String? categoryName;

  @override
  Widget build(BuildContext context) {
    var provider2 = Provider.of<Provider2>(context);
    categoryName = ModalRoute.of(context)!.settings.arguments.toString();
    categoryProducts = Provider.of<ProductsProvider>(context, listen: false)
        .findByCategory(categoryName!);
    // List list = List.generate(categoryProducts!.length, (index) => null);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        categoryName.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        'enjoy with The best $categoryName in the world',
                        style: TextStyle(fontSize: 17),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Over ${categoryProducts!.length - 2} results in $categoryName',
                              style: TextStyle(fontSize: 17),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Filter',
                                      style: TextStyle(color: Colors.teal),
                                    ),
                                    Icon(
                                      Icons.arrow_right_alt_outlined,
                                      color: Colors.teal,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                          children: categoryProducts!.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                ProductDetailsScreen.route,
                                arguments: [e.id, e.productCategoryName]);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Best Seller',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10))),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Image.network(
                                            e.imageUrl.toString(),
                                            fit: BoxFit.contain,
                                          ),
                                          constraints:
                                              BoxConstraints(maxHeight: 150),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 200),
                                            child: Text(
                                              e.description.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                              'by ${categoryProducts![0].brand}'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              Icon(
                                                Icons.star_half,
                                                color: Colors.orangeAccent,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            child: Text(
                                              '\$${e.price.toString()}',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text('Arrives: '),
                                              Text(
                                                '${DateFormat.MEd().format(DateTime.now())}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              offset: Offset(2.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            'See all results',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 17),
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ]))
        ],
      ),
      bottomNavigationBar: provider2.buildBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 5,
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: Icon(
              Icons.circle,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
