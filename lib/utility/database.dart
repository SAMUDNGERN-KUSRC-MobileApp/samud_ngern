import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  getAllRecord() {
    return transactions.where('userid', isEqualTo: user!.uid);
  }
}
