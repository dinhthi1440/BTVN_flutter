void pascalTriangle(int n) {
  for (int i = 0; i < n; i++) {
    String row = '';
    int number = 1;
    for (int j = 2; j <= n - i; j++) {
      row+=' ';
    }
    for (int j = 0; j <= i; j++) {
      row += '$number ';
      number = number * (i - j) ~/ (j + 1);
    }
    print('$row');
  }
}

void main() {
  pascalTriangle(5);
}