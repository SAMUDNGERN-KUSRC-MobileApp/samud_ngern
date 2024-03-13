import 'package:flutter/material.dart';

class transactionPage extends StatelessWidget{
  transactionPage({super.key});
  var today = DateTime.now();

  List<String> thaiMonths = ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม', 'มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [

            const SizedBox(height: 40),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextButton(
                    onPressed: null,
                    child: Icon(Icons.chevron_left_rounded, size: 30)
                  ),

                  const SizedBox(width: 60),

                  Text('${thaiMonths[today.month]} ${today.year}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),

                  const SizedBox(width: 60),

                  const TextButton(
                    onPressed: null,
                    child: Icon(Icons.chevron_right_rounded, size: 30)
                  ),

                ]
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: null,

        floatingActionButton: FloatingActionButton.large(
          onPressed: () => {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.green.shade700,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add, size: 40),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
