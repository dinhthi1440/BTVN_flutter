import 'dart:math';

bool isLeapYear(int year) {
  if (year % 4 != 0) {
    return false;
  } else if (year % 100 != 0) {
    return true;
  } else if (year % 400 == 0) {
    return false;
  } else {
    return true;
  }
}

void main() {
  int year = Random().nextInt(4000);
  print(
      'Năm $year là năm nhuận, đúng hay sai? => Đáp án là: ${isLeapYear(year)} ');
}
