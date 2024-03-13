import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGraph({
    super.key,
    required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thurAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );
double maxYValue = weeklySummary
    .map<double>((value) => value as double)
    .reduce((max, value) => value > max ? value : max);
double adjustedMaxValue = ((maxYValue + 1000) ~/ 1000) * 1000;


    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: adjustedMaxValue ,
        minY: 0,
gridData: FlGridData(
  drawHorizontalLine: true,
  drawVerticalLine: false,
horizontalInterval: adjustedMaxValue / 5,
  getDrawingHorizontalLine: (value) {
    return FlLine(
      color: Color.fromARGB(255, 70, 59, 59),
      strokeWidth: 1,
    );
  },
),
        borderData: FlBorderData(
          show: true,
          border: Border(
             top: BorderSide(color: Color.fromARGB(255, 70, 59, 59), width: 1, style: BorderStyle.solid,),
            bottom:
                BorderSide(color: Color.fromARGB(255, 70, 59, 59), width: 1),
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
          ),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Color.fromARGB(255, 219, 190, 59),
                    width: 22,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ],

              ),
            )
            .toList(),
      ),
    );

  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'W',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'F',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'S',
        style: style,
      );
      break;
    default:
      text = const Text(
        'S',
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
