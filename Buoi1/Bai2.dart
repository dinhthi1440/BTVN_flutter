import 'dart:math';

int countLengthNumber(int number) {
  return number.toString().length;
}

void main() {
  int number = Random().nextInt(999999999);
  print('Số chữ số của $number là ${countLengthNumber(number)} ');
}