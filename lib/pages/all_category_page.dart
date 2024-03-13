import 'package:flutter/material.dart';

class allCategoryPage extends StatefulWidget {
  allCategoryPage({super.key});

  @override
  State<allCategoryPage> createState() => _allCategoryPageState();
}

class _allCategoryPageState extends State<allCategoryPage> {
  bool _favorite_icon = false;
  Color favorite_color = Color.fromARGB(255, 4, 81, 19);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.lunch_dining),
                  Text(
                    'อาหารและเครื่องดื่ม',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  _favorite_icon
                      ? Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 4, 81, 19),
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Color.fromARGB(255, 57, 50, 50),
                        ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.undo)),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person),
                  Text(
                    'ของเครื่องใช้',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  _favorite_icon
                      ? Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 4, 81, 19),
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Color.fromARGB(255, 57, 50, 50),
                        )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.directions_bus),
                  Text(
                    'การเดินทาง',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(Icons.favorite),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.health_and_safety),
                  Text(
                    'สุขภาพ',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(Icons.favorite),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.directions_bus),
                  Text(
                    'สาธารณูปโภค',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(Icons.favorite),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.paid),
                  Text(
                    'รายรับ',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(Icons.favorite),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.more_horiz),
                  Text(
                    'อื่นๆ',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(Icons.favorite),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    _favorite_icon = !_favorite_icon;
                    favorite_color = Color.fromARGB(255, 4, 81, 19);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
