import 'dart:math';

bool isPrime(int number){
  if(number < 2) {return false;}
  for(int i=2; i<=number~/2; i++){
    if(number % i == 0 ){
      return false;
    }
  }
  return true;
}

String readNumberInVietNamese(int number){
  List<String> numberWords = ['không', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín', 'mười'];

  if(number >=0 && number<=10){
    return numberWords[number];
  } 
  else if(number>10 && number<20){
    return 'mười ${numberWords[number%10]}';
  }
   else if(number>=20 && number<100){
    if(numberWords[number%10]==4){
      return '${numberWords[number~/10]} mươi tư';
    }else if(numberWords[number%10]==1){
      return '${numberWords[number~/10]} mươi mốt';
    }else{
      return '${numberWords[number~/10]} mươi ${numberWords[number%10]}';
    }
  }
  else{
    if(number%100>0 && number%100<10){
      return '${numberWords[number~/100]} trăm linh ${numberWords[number%100]}';
    }else{
      return '${numberWords[number~/100]} trăm ${readNumberInVietNamese(number%100)}';
    }
  }
}

void main() {
  List<int> listA = List.generate(Random().nextInt(100), (index) => Random().nextInt(1000));
  // List<int> listA = [];
  // for(int i=0; i<Random().nextInt(100); i++){
  //   listA.add(Random().nextInt(1000));
  // }
  print('ListA với chiều dài ${listA.length}: $listA \n');

  Set<int> setB = Set.from(listA);
  print('SetB với chiều dài ${setB.length}: $setB \n');

  List<int> listC = setB.where(isPrime).toList();
  // List<int> listC = [];
  // for(int number in listA){
  //   if(isPrime(number)){
  //     listC.add(number);
  //   }
  // }
  print('ListC với chiều dài ${listC.length}: $listC \n');

  Map<int, String> mapD = {} ;
  for (int number in listC) {
    mapD[number] = readNumberInVietNamese(number);
  }
  print('mapD với chiều dài ${mapD.length}: $mapD \n');
}