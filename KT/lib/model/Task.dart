class Task{
  final String title;
  final String startTime;
  final String endTime;
  final String deadline;
  late bool isFavourite;
  late  bool isCompleted;
  final String remind;
  final String repeat;
  final String color;

  Task({required this.title, required this.startTime, required this.endTime,
    required this.deadline, required this.isFavourite, required this.isCompleted,
    required this.remind, required this.repeat, required this.color});
}