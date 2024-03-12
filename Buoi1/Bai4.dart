String astrologicalSignNames(int day, String month) {
  bool inRange(String startMonth, int startDay, String endMonth, int endDay) {
    return startMonth.compareTo(month)==0 && startDay<=day || endMonth.compareTo(month) ==0 && endDay>=day;
  }

  if (inRange('Mar', 21, 'Apr', 19)) return 'Aries';
  if (inRange('Apr', 20, 'May', 20)) return 'Taurus';
  if (inRange('May', 21, 'Jun', 20)) return 'Gemini';
  if (inRange('Jun', 21, 'Jul', 22)) return 'Cancer';
  if (inRange('Jul', 23, 'Aug', 22)) return 'Leo';
  if (inRange('Aug', 23, 'Sep', 22)) return 'Virgo';
  if (inRange('Sep', 23, 'Oct', 22)) return 'Libra';
  if (inRange('Oct', 23, 'Nov', 21)) return 'Scorpio';
  if (inRange('Nov', 22, 'Dec', 21)) return 'Sagittarius';
  if (inRange('Dec', 22, 'Jan', 19)) return 'Capricorn';
  if (inRange('Jan', 20, 'Feb', 18)) return 'Aquarius';
  
  return 'Pisces';
}

void main() {
  print(astrologicalSignNames(20, 'Oct')); 
}