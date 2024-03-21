

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {

  runApp(const Bai1());
}

class Bai1 extends StatelessWidget {
  const Bai1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
             Container(
               height: 45,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 30,),
                  Text("Lịch sử hiến máu", textAlign: TextAlign.center, // Căn giữa văn bản
                  style: TextStyle(color: Colors.white)),
                  Container(child: Icon(Icons.chat, color: Colors.white,),
                  margin: EdgeInsets.only(right: 8),)
                ],
              ),
            ),
            SizedBox(width: double.maxFinite, height: 16,),
            Container(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(18))
                        ),
                        child: Padding(
                          child: Image.asset("assets/camera_24.png"),
                          padding: EdgeInsets.all(5),
                        ),
                        height: 35,
                        width: 35,
                      ),

                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Text("Đinh Văn Thi", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6)
              ),),
              margin: EdgeInsets.symmetric(vertical: 16),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text("Mức 2", style: TextStyle(color: Colors.white),),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.grey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 100,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))
                              )
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: Text("Lần 4"),
                            alignment: Alignment.center,
                            color: Colors.cyanAccent,
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("25/01/2024"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Image.asset("assets/syringe_outline.png"),
                                              margin: EdgeInsets.only(right: 8),
                                            ),
                                            Text("350 ml (Toàn phần)")
                                          ],
                                        ),
                                        Text("Trung tâm Mẫu Quốc gia")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(16),
                                    child: Image.asset("assets/skip_track.png"),
                                  )
                                ],
                              ),
                            ),
                          )
              
              
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                              width: 20,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))
                              )
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: Text("Lần 3"),
                            alignment: Alignment.center,
                            color: Colors.cyanAccent,
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("25/01/2023"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Image.asset("assets/syringe_outline.png"),
                                              margin: EdgeInsets.only(right: 8),
                                            ),
                                            Text("350 ml (Toàn phần)")
                                          ],
                                        ),
                                        Text("Trung tâm Mẫu Quốc gia")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(16),
                                    child: Image.asset("assets/skip_track.png"),
                                  )
                                ],
                              ),
                            ),
                          )
              
              
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                              width: 20,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))
                              )
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: Text("Lần 2"),
                            alignment: Alignment.center,
                            color: Colors.cyanAccent,
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("25/01/2022"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Image.asset("assets/syringe_outline.png"),
                                              margin: EdgeInsets.only(right: 8),
                                            ),
                                            Text("350 ml (Toàn phần)")
                                          ],
                                        ),
                                        Text("Trung tâm Mẫu Quốc gia")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(16),
                                    child: Image.asset("assets/skip_track.png"),
                                  )
                                ],
                              ),
                            ),
                          )
              
              
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class Bai2 extends StatelessWidget{
  const Bai2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                    child: Text("Hi, Đinh Văn Thi", style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),)),
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.notifications)
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                      color: Colors.black,
                      width: 2
                    )
                  ),
                )
              ],
            ),
             Container(
               margin: const EdgeInsets.all(8), alignment: Alignment.center, decoration: BoxDecoration(
                 color: Color(0xffefeded),
                 borderRadius: BorderRadius.circular(20)
             ),
               child: Row(
                 children: [
                   Expanded(
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             const Image(image: AssetImage('assets/cld_images.png'), height: 100,width: 100,),
                             const Column(
                                 children: [
                                   Text("Thời khoá biểu"),
                                   Text("20 tháng 3")
                                 ]
                             ),
                             Container(
                               alignment: Alignment.center,
                               child: Text("Lịch thi"),
                               width: 80,
                               height: 35,
                               decoration: BoxDecoration(
                                   color: Colors.blue,
                                   borderRadius: BorderRadius.circular(20)

                               ),

                             )
                           ],
                         ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Không có lịch!"),
                                Text("Xem thêm TKB", style: TextStyle(
                                    color: Colors.blue
                                ),)
                              ],
                            ),
                          )

                       ],
                     ),
                   )
                 ],
               )
             ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(16),
              child: Expanded(
                child: Text("Thông báo gần đây",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xffefeded),
                  borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    child: const Text("THÔNG BÁO V/v mở, không mở các lớp học phần trong"
                        " học kỳ 2 năm học 2023-2024 cho sinh viên Đại học các khoá",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          child: Image(
                            height: 16,
                            width: 16,
                            image: AssetImage("assets/clock.png"),
                          ),
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text("03:30 02/02/2024", style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(16),
              child: Text("Tiện ích", style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),),
            ),
            Container(
              child: Column(
                
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Image.asset("assets/money_icon.png"),
                                decoration: BoxDecoration(
                                    color: Color(0xffefeded),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 8),
                              ),
                              Text("Tài chính", style: TextStyle(
                                  fontSize: 12
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Image.asset("assets/bar_chart.png"),
                                decoration: BoxDecoration(
                                    color: Color(0xffefeded),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 8),
                              ),
                              Text("Kết quả HP", style: TextStyle(
                                  fontSize: 12
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Image.asset("assets/list.png"),
                                decoration: BoxDecoration(
                                    color: Color(0xffefeded),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 8),
                              ),
                              Text("Học phần", style: TextStyle(
                                  fontSize: 12
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Image.asset("assets/graduate.png"),
                                decoration: BoxDecoration(
                                    color: Color(0xffefeded),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 8),
                              ),
                              Text("Tốt nghiệp", style: TextStyle(
                                  fontSize: 12
                              ),)
                            ],
                          )

                        ],
                      ),
                  ),

                ],
              ),
            ),
            Container(
              child: Column(

                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(

                          children: [
                            Container(
                              child: Image.asset("assets/telephone.png"),
                              decoration: BoxDecoration(
                                  color: Color(0xffefeded),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(bottom: 8),
                            ),
                            Text("DV một cửa", style: TextStyle(
                              fontSize: 12
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Image.asset("assets/copy_writing.png"),
                              decoration: BoxDecoration(
                                  color: Color(0xffefeded),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(bottom: 8),
                            ),
                            Text("Đánh giá rèn\n luyện", style: TextStyle(
                                fontSize: 12
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Image.asset("assets/question.png"),
                              decoration: BoxDecoration(
                                  color: Color(0xffefeded),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(bottom: 8),
                            ),
                            Text("Hỏi đáp", style: TextStyle(
                                fontSize: 12
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Image.asset("assets/pencil_crayon.png"),
                              decoration: BoxDecoration(
                                  color: Color(0xffefeded),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(bottom: 8),
                            ),
                            Text("Khảo sát", style: TextStyle(
                                fontSize: 12
                            ),)
                          ],
                        )

                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
