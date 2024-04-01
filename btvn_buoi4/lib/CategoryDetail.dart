
import 'package:btvn_buoi4/FoodDetail.dart';
import 'package:btvn_buoi4/model/FoodCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'model/Food.dart';


class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key, required this.category});
  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink,
        title: Text("${category.name}",style: TextStyle(color: Colors.white)),
      ),
      body:  SafeArea(
          child: ListView.builder(
              itemCount: category.listFood.length,
              itemBuilder: (context, index){
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) => FoodDetail(
                            food: category.listFood[index],
                          )
                          )
                          );
                        },
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            AspectRatio(
                              aspectRatio: 16/7,
                              child: Image(
                                image: NetworkImage(category.listFood[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              width: 300,
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text("${category.listFood[index].titleName}",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white
                                ),),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Container(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.punch_clock),
                                    Text("${category.listFood[index].timeCook} min")
                                  ],
                                ),
                              )
                          ),
                          Flexible(
                              child: Container(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_bag),
                                    Text("Simple")
                                  ],
                                ),
                              )
                          ),
                          Flexible(
                              child: Container(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.monetization_on_outlined),
                                    Text("Affordable")
                                  ],
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
          )
      ),
    );
  }
}

