import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class updateForm extends StatefulWidget {
  const updateForm({super.key});

  @override
  State<updateForm> createState() => _updateFormState();
}

class _updateFormState extends State<updateForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;

    final titleController = TextEditingController(text: data['title']);
    final conversationController =
        TextEditingController(text: data['conversation']);

    //------------ สร้าง collection สำหรับเก็บข้อมูล -------------
    CollectionReference topicCollection =
        FirebaseFirestore.instance.collection('topic');

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
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Edit conversation',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Add a title',
                    icon: Icon(Icons.title),
                  ),
                  // validator: (value) {
                  //   if (value!.isEmpty) return 'กรุณากรอกชื่อ';
                  //   return null;
                  // },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 3,
                  controller: conversationController,
                  decoration: const InputDecoration(
                    hintText: 'Start a new conversation',
                    icon: Icon(Icons.description),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please add a conversation';
                    // if (value!.length < 6) return 'Too short';
                    return null;
                  },
                  // onChanged: (value) => setState(() {
                  //   _conversationText = value;
                  // }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancle'),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {
                        //---------- แก้ไขข้อมูลใน collection ใช้ .update ----------
                        //---------- data.id คือ id ของข้อมูลที่อยู่ในตัวแปร data
                        topicCollection.doc(data.id).update({
                          'title': titleController.text,
                          'conversation': conversationController.text
                        });

                        Navigator.pop(context);
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
