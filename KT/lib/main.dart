import 'package:flutter/material.dart';
import 'package:kiem_tra/model/Task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static List<Task> tasks = [
    Task(title: "Học bài", startTime: "9:40", endTime: "10:10", deadline: "10:20",
        isFavourite: false, isCompleted: false, remind: "Không có gì cần nhớ",
        repeat: "Lặp lại", color: Colors.blue.toString()),
    Task(title: "Đi ăn cơm", startTime: "2:40", endTime: "4:10", deadline: "5:20",
        isFavourite: false, isCompleted: false, remind: "Không cần",
        repeat: "Lặp lại", color: Colors.blue.toString()),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Board(tasks: tasks),
        ),
      ),
    );
  }
}


class Board extends StatefulWidget {
  const Board({super.key, required this.tasks});
  final List<Task> tasks;
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            title: Text("Board"),
            actions: <Widget>[
              InkWell(
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {

                    }
                ),
              ),
              InkWell(
                child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {

                    }
                ),
              ),
              InkWell(
                child: IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () {

                    }
                ),
              ),

            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text("All"),
                ),
                Tab(
                  child: Text("Uncompleted"),
                ),
                Tab(
                  child: Text("Completed"),
                ),
                Tab(
                  child: Text("Favourite"),
                ),
              ],
            )
        ),
        body: TabBarView(
          children: [
            TabAll(tasks: widget.tasks,),
            Text("hha"),
            Completed(tasks: widget.tasks.where((element) => element.isCompleted == true).toList()),
            Text("hha"),
          ],
        ),
      ),
    );
  }
}


class TabAll extends StatefulWidget {
  const TabAll({super.key, required this.tasks});
  final List<Task> tasks;
  @override
  State<TabAll> createState() => _TabAllState();
}

class _TabAllState extends State<TabAll> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Checkbox(
                      value: widget.tasks[index].isCompleted,
                      onChanged: (bool? value) {
                        setState(() {
                          widget.tasks[index].isCompleted = value!;
                          print(widget.tasks[index].isCompleted);
                        });
                      },
                    ),
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.tasks[index].title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            "From: ${widget.tasks[index].runtimeType} - To: ${widget.tasks[index].endTime} ",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Text("Deadline: ${widget.tasks[index].deadline}",
                            style: TextStyle(
                                color: Colors.white
                            ),

                          ),
                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.favorite_border),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}



class Completed extends StatefulWidget {
  const Completed({super.key, required this.tasks});
  final List<Task> tasks ;
  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    widget.tasks;
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Checkbox(
                    value: widget.tasks[index].isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        widget.tasks[index].isCompleted = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.tasks[index].title}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          "From: ${widget.tasks[index].runtimeType} - To: ${widget.tasks[index].endTime} ",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        Text("Deadline: ${widget.tasks[index].deadline}",
                          style: TextStyle(
                              color: Colors.white
                          ),

                        ),
                      ],
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.favorite_border),
                )
              ],
            ),
          );
        }
    );
  }
}





