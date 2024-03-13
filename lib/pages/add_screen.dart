import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utility/database.dart';
import '../utility/alert.dart';

final expensies = [
  'รายรับ',
  'รายจ่าย',
];

final categories = [
  'ค่าอาหาร',
  'ค่าเครื่องใช้',
  'ค่าเดินทาง',
  'ค่ารักษาพยาบาล',
  'สาธารณูปโภค',
  'เงินเดือน',
  'อื่น ๆ',
];

class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  /*final TextEditingController _controller = TextEditingController(
    text: DateTime.now().toString(),
  );*/

  var currentDate = DateTime.now();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final TextEditingController dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
  );

  String expenses = expensies.first;

  String category = categories.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff368983),
          title: const Center(
              child: Text('บันทึกข้อมูล',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ),
        backgroundColor: Colors.grey.shade200,
        body: Stack(children: [
          //ส่วนตกแต่ง//
          Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
              color: Color(0xff368983),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),

          Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),

          //จัดตำแหน่งปุ่มต่างๆ//
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Form(
                  child: Column(children: [
                    const SizedBox(height: 100),

                    //เลือกประเภท//
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(),
                          color: const Color.fromARGB(255, 200, 206, 200)),
                      child: DropdownButtonFormField<String>(
                        value: expenses,
                        items: expensies
                            .map((expenses) => DropdownMenuItem(
                                value: expenses, child: Text(expenses)))
                            .toList(),
                        onChanged: (value) {
                          setState(() => expenses = value!);
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_balance_wallet,
                              size: 30, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    //boxกรอกจำนวนเงิน//
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 200, 206, 200),
                          prefixIcon: const Icon(
                            Icons.paid,
                            size: 20,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          suffixText: '฿',
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    //เลือกหมวดหมู่//
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(),
                        color: const Color.fromARGB(255, 200, 206, 200),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: category,
                        items: categories
                            .map((category) => DropdownMenuItem(
                                value: category, child: Text(category)))
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            category = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.paid,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: MaterialButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(1999),
                            lastDate: DateTime(2090),
                          ).then((newDate) {currentDate = newDate!.toLocal();});
                        },

                        color: const Color.fromARGB(255, 200, 206, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.black),
                        ),

                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month,size: 20,color: Colors.white),
                              Text('เลือกวันที่',style: TextStyle(color: Colors.white,fontSize: 25)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    //โน็ตใส่รายละเอียดอื่นๆ//
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        controller: noteController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 200, 206, 200),
                          prefixIcon: const Icon(
                            Icons.edit_note,
                            size: 20,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          try {
                            if (double.parse(amountController.text) <= 0) {
                              throw const FormatException('Expected amount');
                            }
                            database().add(
                                double.parse(amountController.text),
                                expensies.indexOf(expenses),
                                categories.indexOf(category),
                                currentDate,
                                noteController.text);
                            Navigator.pop(context);
                          } catch (e) {
                            showAlert('Amount Error', 'Please Enter Amount!',
                                context);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 200, 206, 200),
                          ), // กำหนดสีเป็นสีเขียว
                        ),
                        child: const Text('บันทึก'),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          )
        ])); //กรอก
  }
}
