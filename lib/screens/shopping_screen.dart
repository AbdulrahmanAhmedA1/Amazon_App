import 'package:flutter/material.dart';
import 'package:flutter_amazon/providers/provider2.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController!.reset();
              _animationController!.forward();
            }
          });
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider2 = Provider.of<Provider2>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: provider2.buildFlexibleSpace(context, 0),
      ),
      body: CustomScrollView(
        slivers: [
          provider2.sliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://media.istockphoto.com/photos/man-at-the-shopping-picture-id868718238?k=6&m=868718238&s=612x612&w=0&h=ZUPCx8Us3fGhnSOlecWIZ68y3H4rCiTnANtnjHk0bvo='),
                            alignment: FractionalOffset(_animation!.value, 0),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * .5),
                        child: Text(
                          'Your Amazon basket is empty',
                          style: TextStyle(fontSize: 17),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Continue shopping',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow.shade600),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
              ),
            ),
          ]))
        ],
      ),
      bottomNavigationBar: provider2.buildBottomNavigationBar(context),
    );
  }
}
