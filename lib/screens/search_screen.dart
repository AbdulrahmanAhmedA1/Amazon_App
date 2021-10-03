import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_amazon/screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  static final String route = '/SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool auto = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    auto = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (_, animation1, animation2) => Home(),
                    transitionsBuilder: (_, animation1, animation2, child) {
                      Tween<Offset> tween = Tween<Offset>(
                          begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0));
                      Animation<Offset> animationOffset =
                          animation1.drive(tween);
                      return SlideTransition(
                        position: animationOffset,
                        child: child,
                      );
                    }));
              }),
        ],
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
                padding: const EdgeInsets.only(
                    right: 50, top: 8, bottom: 8, left: 15),
                child: Container(
                  child: TextField(
                    autofocus: true,
                    onEditingComplete: () {
                      Navigator.of(context).pushReplacement(PageRouteBuilder(
                          pageBuilder: (_, animation1, animation2) => Home(),
                          transitionsBuilder:
                              (_, animation1, animation2, child) {
                            Tween<Offset> tween = Tween<Offset>(
                                begin: Offset(-1.0, 0.0),
                                end: Offset(0.0, 0.0));
                            Animation<Offset> animationOffset =
                                animation1.drive(tween);
                            return SlideTransition(
                              position: animationOffset,
                              child: child,
                            );
                          }));
                    },
                    textDirection: TextDirection.rtl,
                    onSubmitted: (String? val) {},
                    cursorHeight: 25,
                    cursorColor: Colors.teal,
                    onTap: () {},
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(7)),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 10,
                        ),
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                          fontSize: 18,
                        ),
                        hintText: 'البحث في Amazon.eg',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}
