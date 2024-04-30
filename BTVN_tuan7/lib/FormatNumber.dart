
import 'package:intl/intl.dart';

class FormatNumber {
  static String formatNumber(int numOfSold) {
    if (numOfSold >= 1000) {
      double soldInK = numOfSold / 1000;
      return '${soldInK.toStringAsFixed(2)}K';
    } else {
      return '$numOfSold';
    }
  }
  static String formatMoney(int money) {
    NumberFormat formatter = NumberFormat("#,###", "en_US");
    return formatter.format(money);
  }
}
