import 'package:flutter/material.dart';
import 'all_category_page.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});
  @override
  State<OtherPage> createState() => _OtherPage();
}

class _OtherPage extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 243),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(150, 182, 197, 1),
          title: const Center(
            child: Text(
              'other',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const all_category()),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.bookmark),
                      Text(
                        'หมวดหมู่',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(30),
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.person),
                    Text(
                      'ออกจากระบบ',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Icon(Icons.logout),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
