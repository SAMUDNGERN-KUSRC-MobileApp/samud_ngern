import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'incom.dart';
import 'bar_home.dart';
import '../utility/my_navigation_bar.dart';

class ProductData {
  final String name;
  final double price;

  ProductData(this.name, this.price);
}

class expane extends StatefulWidget {
  @override
  _expaneState createState() => _expaneState();
}

class _expaneState extends State<expane> {
  int touchedIndex = -1;

  List<ProductData> products = [
    ProductData('Foods', 2800),
    ProductData('Items', 2500),
    ProductData('Transport', 800),
    ProductData('Health', 300),
    ProductData('Utilities', 300),
  ];

  List<IconData> sectionIcons = [
    Icons.fastfood_rounded,
    Icons.watch,
    Icons.directions_bus_rounded,
    Icons.health_and_safety,
    Icons.water_drop,
  ];

  var mouth = 'เมษายน';
  var year = '2024';

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
              const SizedBox(height: 40),
              _toggle(),
              _buildingUI(),
            ],
          ),
        ),
        bottomNavigationBar: myNavigationBar(context, 2)
      ),
    );
  }

  Widget _toggle() {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 20),
                Text(
                  '$mouth $year',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildingUI() {
    double totalPrice = products.fold(0, (sum, product) => sum + product.price);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 2,
            color: Color.fromARGB(255, 208, 204, 204),
            margin: EdgeInsets.symmetric(vertical: 5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => incom()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 203, 203),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'รายรับ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => expane(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'รายจ่าย',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 500,
            height: 400,
            child: Stack(
              children: [
                Container(
                  width: 500,
                  height: 400,
                  color: Color.fromARGB(255, 232, 230, 230),
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchRespone) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchRespone == null ||
                                pieTouchRespone.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchRespone
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      sections: PieChartSection(totalPrice),
                      centerSpaceRadius: 50,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '฿ ${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: totalPrice > 1000000
                          ? 14
                          : (totalPrice > 100000
                              ? 16
                              : 18),
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 216, 97, 41),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 140,
                  child: Text(
                    'แสดงตามหมวดหมู่',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => barHome(
                            products: products,
                            sectionsIcons: sectionIcons,
                            totalPrice: totalPrice,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Color.fromARGB(255, 238, 189, 91).withOpacity(0.5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.bar_chart_sharp,
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
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                if (products[index].price == 0) {
                  return SizedBox();
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  sectionIcons[index % sectionIcons.length],
                                  color: Colors.black,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${products[index].name}',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '฿ ${products[index].price.toStringAsFixed(2)}',
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
    );
  }

  List<PieChartSectionData> PieChartSection(double totalPrice) {
    List<Color> customColors = [
      Color.fromARGB(255, 202, 61, 51),
      const Color.fromARGB(255, 38, 113, 174),
      const Color.fromARGB(255, 62, 156, 65),
      Color.fromARGB(255, 228, 214, 84),
      Colors.purple,
    ];

    return List.generate(
      products.length,
      (index) {
        double percentage = (products[index].price / totalPrice) * 100;
        bool isTouched = index == touchedIndex;
        return PieChartSectionData(
          color: customColors[index],
          value: percentage,
          title: isTouched ? '' : ' ${percentage.toInt()}%',
          radius: isTouched ? 60 : 50,
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isTouched ? Colors.transparent : Colors.white,
          ),
          badgeWidget: isTouched
              ? Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${products[index].name}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '฿ ${products[index].price.toStringAsFixed(2)} ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          badgePositionPercentageOffset: 1.55,
        );
      },
    );
  }
}
