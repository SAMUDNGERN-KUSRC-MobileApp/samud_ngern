import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../pages/add_screen.dart';
import 'updateForm.dart';

final Future<FirebaseApp> firebase = Firebase.initializeApp();

void main() async {
  //------------ prepare Firebase ------------
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(99, 136, 137, 1),
        title: const Center(
          child: Text(
            'Example Firebase',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const home(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //------ ไปหน้า addForm ------
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const addScreen()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
//------------ สร้าง collection สำหรับเก็บข้อมูล -------------
  CollectionReference transactions = FirebaseFirestore.instance.collection('transactions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: transactions.snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: ((context, index) {
                    var topicIndex = snapshot.data!.docs[index];
                    return GestureDetector(
                      //--- เมื่อคลิกที่ข้อมูล title ที่ดึงมาให้แสดง popup เพื่อแสดงรายละเอียด ---
                      onTap: () {
                        //---- เรียกฟังก์ชันชื่อ showDetail ด้านล่าง ----
                        showDetail(topicIndex);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(topicIndex['amount'].toString()),
                        subtitle: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(topicIndex['type'] == 0 ? 'Income' : 'Outcome'),
                                Text(['foods', 'items', 'transport', 'health', 'utilities', 'salary', 'other'][topicIndex['category']]),
                                Text(topicIndex['date'].toString()),
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
                                            builder: (context) => const updateForm(),
                                            settings: RouteSettings(
                                                arguments: topicIndex)),
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
                                        deleteDialog(topicIndex);
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
          })),
    );
  }

  //-------------- ฟังก์ชันแสดง popup เพื่อยืนยันการลบข้อมูล --------------
  deleteDialog(dynamic model) async {
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

  //-------------- ฟังก์ชันแสดง popup เพื่อแสดงรายละเอียดข้อมูล --------------
  showDetail(dynamic model) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(249, 239, 219, 1),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      '${model['title']}',
                      style: const TextStyle(fontSize: 25),
                    )),
                    Text('${model['conversation']}',
                        style: const TextStyle(fontSize: 15)),
                  ],
                )),
          );
        });
  }
}
