import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

var getIconMain = [
  Icons.fastfood_rounded,
  Icons.watch,
  Icons.directions_bus_rounded,
  Icons.health_and_safety,
  Icons.water_drop,
  Icons.wallet,
  Icons.more_horiz_rounded,
  Icons.settings
];

class database {
  CollectionReference transactions = FirebaseFirestore.instance.collection('transactions');
  final user = FirebaseAuth.instance.currentUser;

  add(double amount, int type, int category, DateTime date, note) {
    transactions.add({
        'userid': user!.uid,
        'amount': amount,
        'type': type,
        'category': category,
        'date': date,
        'note': note
      }
    );
  }

  update(id, double amount, int type, int category, DateTime date, note) {
    transactions.doc(id).update({
        'userid': user!.uid,
        'amount': amount,
        'type': type,
        'category': category,
        'date': date,
        'note': note
      }
    );
  }

  CollectionReference getAllRecord() {
    return transactions;
    // .where('userid', isEqualTo: user!.uid)
  }

   getUid() {
    return user!.uid;
    // .where('userid', isEqualTo: user!.uid)
  }

  Stream getOnlyUserRecord() {
    return transactions.where('userid', isEqualTo: user!.uid).snapshots();
  }

  int getIncome() {
    transactions.get();
    return (0);
  }
}
