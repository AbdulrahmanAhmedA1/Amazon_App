import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
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
  ));
}
