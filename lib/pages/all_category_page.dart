import 'package:flutter/material.dart';

// ไฟล์ all_category หมวดหมู่ทั้งหมด เปลี่ยนชื่อได้เลยๆ

class all_category extends StatefulWidget {
  const all_category({super.key});

  @override
  State<all_category> createState() => _all_categoryState();
}

class _all_categoryState extends State<all_category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
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
                  Icon(Icons.favorite),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
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
                  Icon(Icons.favorite),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
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
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
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
              padding: const EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
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
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
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
              padding: const EdgeInsets.all(30),
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
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
            )
          ],
        ),
      ),
    );
  }
}
