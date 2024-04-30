import 'package:btvn_tuan7/FormatNumber.dart';
import 'package:btvn_tuan7/main.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class FoodDetail extends StatelessWidget {

  const FoodDetail({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Image(image: NetworkImage(food.imageUlr)),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    leading: Material(
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.title, style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                    Text(
                      food.describe,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${FormatNumber.formatNumber(food.numOfSold)} đã bán | ${FormatNumber.formatNumber(food.numOfLike)} lượt thích",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${FormatNumber.formatMoney(food.cost)}đ",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        PlusMinusButton(context, food)
                      ],
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
