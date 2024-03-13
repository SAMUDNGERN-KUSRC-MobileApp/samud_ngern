import 'individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<individaulBar> barData = [];

  void initializeBarData() {
    barData = [
      individaulBar(x: 0, y: sunAmount),
      individaulBar(x: 1, y: monAmount),
      individaulBar(x: 2, y: tueAmount),
      individaulBar(x: 3, y: wedAmount),
      individaulBar(x: 4, y: thurAmount),
      individaulBar(x: 5, y: friAmount),
      individaulBar(x: 6, y: satAmount),
    ];
  }
}
