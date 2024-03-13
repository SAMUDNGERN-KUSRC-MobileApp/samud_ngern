import 'package:flutter/material.dart';
import 'my_bar_graph.dart';
import 'expane.dart';
import '../utility/my_navigation_bar.dart';

class barHome extends StatefulWidget {
  final List<ProductData> products;
  final List<IconData> sectionsIcons;
  final double totalPrice;

  const barHome(
      {Key? key,
      required this.products,
      required this.sectionsIcons,
      required this.totalPrice})
      : super(key: key);

  @override
  State<barHome> createState() => _staticState();
}

List<double> weeklySummary = [
  20000.40,
  700.50,
  353.42,
  500.55,
  1000.50,
  4403.67,
  560.89,
];

class _staticState extends State<barHome> {
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Kanit',
        primaryColor: Colors.grey.shade800,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'การใช้จ่ายสัปดาห์นี้',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'การจ่ายแต่ละวัน',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    Text(
                      'Weeks Total:${totalPrice.toStringAsFixed(2)} ฿',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  width: 390,
                  child: MyBarGraph(
                    weeklySummary: weeklySummary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    Column(
                      children:  [
                        Text(
                          'แสดงตามหมวดหมู่',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 160),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => expane(),
                            ),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 238, 189, 91).withOpacity(0.5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.pie_chart_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: widget.products.length,
                  itemBuilder: (context, index) {
                    if (widget.products[index].price == 0) {
                      return SizedBox();
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      widget.sectionsIcons[
                                          index % widget.sectionsIcons.length],
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '${widget.products[index].name}',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '฿ ${widget.products[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(221, 155, 28, 28),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 2,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: myNavigationBar(context, 2)
      ),
    );
  }
}
