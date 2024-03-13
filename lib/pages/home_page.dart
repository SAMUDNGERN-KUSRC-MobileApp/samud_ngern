import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/utility/database.dart';
import 'add_screen.dart';
import '../utility/my_navigation_bar.dart';

// ignore: must_be_immutable
class homePage extends StatelessWidget {
  homePage({super.key});

  var today = DateTime.now();

  List<String> thaiMonths = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const TextButton(
                    onPressed: null,
                    child: Icon(Icons.chevron_left_rounded, size: 30)),
                const SizedBox(width: 60),
                Text('${thaiMonths[today.month]} ${today.year}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600)),
                const SizedBox(width: 60),
                const TextButton(
                    onPressed: null,
                    child: Icon(Icons.chevron_right_rounded, size: 30)),
              ]),
            ),
            const SizedBox(height: 20),
            const SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('รายรับ'),
                    Text('+XXXX ฿'),
                  ],
                ),
                Column(
                  children: [
                    const Text('รายรับ'),
                    Text('-XXXX ฿'),
                  ],
                ),
                Column(
                  children: [
                    const Text('รายรับ'),
                    Text('XXXX ฿'),
                  ],
                ),
              ],
            )),
            const SizedBox(height: 20),
            // SingleChildScrollView(
            //     child: StreamBuilder(
            //         stream: database().getAllRecord(),
            //         builder: ((context, snapshot) {
            //           if (snapshot.hasData) {
            //             return ListView.builder(
            //                 itemCount: snapshot.data!.docs.length,
            //                 itemBuilder: ((context, index) {
            //                   var topicIndex = snapshot.data!.docs[index];
            //                   return GestureDetector(
            //                     //--- เมื่อคลิกที่ข้อมูล title ที่ดึงมาให้แสดง popup เพื่อแสดงรายละเอียด ---
            //                     onTap: () {
            //                       //---- เรียกฟังก์ชันชื่อ showDetail ด้านล่าง ----
            //                       // showDetail(topicIndex);
            //                     },
            //                     child: ListTile(
            //                       leading: CircleAvatar(
            //                         backgroundColor: Colors.grey[300],
            //                         child: const Icon(Icons.person,
            //                             color: Colors.white),
            //                       ),
            //                       title: Text(topicIndex['amount'].toString()),
            //                       subtitle: Container(
            //                           alignment: Alignment.topLeft,
            //                           child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.start,
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.stretch,
            //                             children: [
            //                               Text(topicIndex['type'] == 0
            //                                   ? 'Income'
            //                                   : 'Outcome'),
            //                               Text([
            //                                 'foods',
            //                                 'items',
            //                                 'transport',
            //                                 'health',
            //                                 'utilities',
            //                                 'salary',
            //                                 'other'
            //                               ][topicIndex['category']]),
            //                               Text(topicIndex['date'].toString()),
            //                             ],
            //                           )),
            //                       trailing: SizedBox(
            //                         width: 70,
            //                         child: Row(
            //                           children: [
            //                             //----------- icon รูปดินสอ สีเขียว -----------
            //                             Expanded(
            //                               child: IconButton(
            //                                   onPressed: () {
            //                                     // Navigator.push(
            //                                     //   context,
            //                                     //   MaterialPageRoute(
            //                                     //       builder: (context) =>
            //                                     //           const updateForm(),
            //                                     //       settings: RouteSettings(
            //                                     //           arguments:
            //                                     //               topicIndex)),
            //                                     // );
            //                                   },
            //                                   icon: const Icon(
            //                                     Icons.edit,
            //                                     color: Colors.green,
            //                                   )),
            //                             ),
            //                             const SizedBox(width: 15),
            //                             //----------- icon รูปถังขยะ สีแดง -----------
            //                             Expanded(
            //                                 child: IconButton(
            //                                     onPressed: () {
            //                                       //---- เรียกฟังก์ชันชื่อ deleteDialog ด้านล่าง ----
            //                                       /// The `deleteDialog(topicIndex);` is calling a
            //                                       /// function named `deleteDialog` and passing the
            //                                       /// `topicIndex` as an argument. This function is
            //                                       /// likely responsible for showing a dialog or
            //                                       /// confirmation popup to ask the user if they want to
            //                                       /// delete the item represented by the `topicIndex`.
            //                                       /// Typically, this dialog would provide options for
            //                                       /// the user to confirm or cancel the deletion
            //                                       /// operation.
            //                                       // deleteDialog(topicIndex);
            //                                     },
            //                                     icon: const Icon(
            //                                       Icons.delete,
            //                                       color: Colors.red,
            //                                     )))
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   );
            //                 }));
            //           } else {
            //             return const Text('No data');
            //           }
            //         })))
          ],
        ),
      ),
      bottomNavigationBar: myNavigationBar(context, 0),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const addScreen(),
            ),
          )
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add, size: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // showDetail(dynamic model) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           backgroundColor: const Color.fromRGBO(249, 239, 219, 1),
  //           shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(10))),
  //           title: SizedBox(
  //               height: 200,
  //               child: Column(
  //                 children: [
  //                   Center(
  //                       child: Text(
  //                     '${model['title']}',
  //                     style: const TextStyle(fontSize: 25),
  //                   )),
  //                   Text('${model['conversation']}',
  //                       style: const TextStyle(fontSize: 15)),
  //                 ],
  //               )),
  //         );
  //       }
  //     );
  // }
}
