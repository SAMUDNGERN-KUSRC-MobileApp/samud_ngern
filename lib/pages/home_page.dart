import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/utility/database.dart';
import 'package:intl/intl.dart';
import 'add_screen.dart';
import 'update_form.dart';
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

  // Icon getIcon(){
  //   return Icons.person;
  // }

  DateTime getDateTime(timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(
        timestamp.seconds * 1000 + (timestamp.nanoseconds / 1000000).round());
  }

  CollectionReference transactions = database().getAllRecord();

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
            // const SizedBox(
            //     child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Column(
            //       children: [
            //         const Text('รายรับ'),
            //         Text('+XXXX ฿'),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         const Text('รายรับ'),
            //         Text('-XXXX ฿'),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         const Text('รายรับ'),
            //         Text('XXXX ฿'),
            //       ],
            //     ),
            //   ],
            // )),
            // const SizedBox(height: 20),
            SingleChildScrollView(
                child: StreamBuilder(
                    stream: transactions
                        .where('userid', isEqualTo: database().getUid())
                        .snapshots(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: ((context, index) {
                              var topicIndex = snapshot.data!.docs[index];
                              return GestureDetector(
                                //--- เมื่อคลิกที่ข้อมูล title ที่ดึงมาให้แสดง popup เพื่อแสดงรายละเอียด ---
                                onTap: () {
                                  //---- เรียกฟังก์ชันชื่อ showDetail ด้านล่าง ----
                                  // showDetail(topicIndex, context);
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: Icon(
                                        getIconMain[topicIndex['category']],
                                        color: ((topicIndex['type']) == 1
                                            ? Colors.red
                                            : Colors.green.shade800)),
                                  ),
                                  title: Text(topicIndex['amount'].toString(),
                                      style: TextStyle(
                                          color: (topicIndex['type']) == 1
                                              ? Colors.red
                                              : Colors.green.shade800)),
                                  subtitle: Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(expensies[topicIndex['type']] +
                                              ' ' +
                                              (topicIndex['note'].isEmpty ==
                                                      true
                                                  ? categories[
                                                      topicIndex['category']]
                                                  : topicIndex['note'])),
                                          Text('Date: ' +
                                              DateFormat('dd/MMM/yyyy').format(
                                                  getDateTime(
                                                      topicIndex['date']))),
                                        ],
                                      )),
                                  trailing: SizedBox(
                                    width: 70,
                                    child: Row(
                                      children: [
                                        //----------- icon รูปดินสอ สีเขียว -----------
                                        Expanded(
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const updateForm(),
                                                      settings: RouteSettings(
                                                          arguments:
                                                              topicIndex)),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.green,
                                              )),
                                        ),
                                        const SizedBox(width: 15),
                                        //----------- icon รูปถังขยะ สีแดง -----------
                                        Expanded(
                                            child: IconButton(
                                                onPressed: () {
                                                  //---- เรียกฟังก์ชันชื่อ deleteDialog ด้านล่าง ----
                                                  deleteDialog(
                                                      topicIndex, context);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));
                      } else {
                        return const Text('No data');
                      }
                    })))
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

  deleteDialog(dynamic model, BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // backgroundColor: Color.fromRGBO(249, 239, 219, 1),
            backgroundColor: Colors.white,
            title: const Text('Are you sure to delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    transactions.doc(model.id).delete();
                    Navigator.pop(context);
                  },
                  //----- ปุ่ม Delete -----
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              //----- ข้อความคำว่า Cancle -----
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancle',
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }
}
