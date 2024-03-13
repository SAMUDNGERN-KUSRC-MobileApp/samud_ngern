import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_main/pages/login_page.dart';
import 'package:flutter_main/utility/my_navigation_bar.dart';

class OtherPage extends StatefulWidget {
  OtherPage({super.key});
  @override
  State<OtherPage> createState() => _OtherPage();
}

class _OtherPage extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Container(
                padding: EdgeInsets.all(40),
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>  allCategoryPage()),
                    // );
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
                padding: const EdgeInsets.all(40),
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const loginPage()));
                  },
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
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: myNavigationBar(context, 3),
      ),
    );
  }
}
