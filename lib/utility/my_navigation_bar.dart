import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_main/pages/incom.dart';
import '../pages/home_page.dart';
import '../pages/other_page.dart';

Color getColor(int iconIndex, int pageIndex)
{
  Color color;

  if (iconIndex == pageIndex) {
    color = Colors.amber.shade800;
  } else {
    color = Colors.grey.shade100;
  }
  return color;
}

List<Widget> getIcon (BuildContext context, int pageIndex) {
  return [
    IconButton(
      onPressed: () {
        if (pageIndex != 0){
          Navigator.pop(context);
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) {
                return homePage();
              }
            )
          );
        }
      },
      icon: Icon(Icons.home_rounded, size: 33, color: getColor(0, pageIndex))
    ),

    IconButton(
      onPressed: () {
      },
      icon: Icon(Icons.calendar_today, size: 28, color: getColor(1, pageIndex))
    ),

    const SizedBox(width: 60),

    IconButton(
      onPressed: () {
        if (pageIndex != 2){
          Navigator.pop(context);
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) {
                return incom();
              }
            )
          );
        }
      },
      icon: Icon(Icons.auto_graph_rounded, size: 30, color: getColor(2, pageIndex))
    ),

    IconButton(
      onPressed: () {
        if (pageIndex != 3){
          Navigator.pop(context);
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) {
                return OtherPage();
              }
            )
          );
        }
      },
      icon: Icon(Icons.more_horiz_rounded, size: 32, color: getColor(3, pageIndex))
    ),
  ];
}

Container myNavigationBar (BuildContext context, int pageIndex) {
  return Container (
    height: 80,
    decoration: BoxDecoration(
      color: Colors.green.shade900,
      border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1))
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: getIcon(context, pageIndex)
    )
  );
}
