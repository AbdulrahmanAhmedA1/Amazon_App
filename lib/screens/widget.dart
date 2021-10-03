import 'package:expanded_bottom_sheet/ScrollableBottomSheet.dart';
import 'package:flutter/material.dart';

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ScrollableBottomSheet().openBottomSheet(
      //   context,
      //   headerWidget: Container(child: Text("Header")),
      //   bodyWidget: SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //           (context, index) => Container(
      //                 color: Colors.red,
      //                 alignment: Alignment.centerLeft,
      //                 padding: EdgeInsets.symmetric(vertical: 10),
      //                 child: Text("$index"),
      //               ),
      //           childCount: 100)),
      //   backgroundColor: Colors.transparent,
      //   backgroundOpacity: 0.2,
      //   headerHeight: 70.0,
      //   hasRadius: true,
      // ),
    );
  }
}
