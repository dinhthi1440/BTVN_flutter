import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/Food.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink,
        title: Text("${food.titleName}",style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: NetworkImage(food.image)),
                Container(
                  padding: EdgeInsets.all(10),
                  child: const Text("Ingredients"),
                ),
                ListView.builder(
                  shrinkWrap: true, // Đặt thuộc tính shrinkWrap thành true để thu gọn kích thước của ListView
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: food.ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      padding: EdgeInsets.all(4),
                      child: Text("${food.ingredients[index]}"),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 32, bottom: 8),
                  child: const Text("Steps"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: food.steps.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Container(
                            child: Text("# ${index+1}", style: const TextStyle(
                                color: Colors.white
                            ),),
                            decoration: const BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.all(Radius.circular(23))
                            ),
                            height: 46,
                            width: 46,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                          ),
                          Expanded(child: Text("${food.steps[index]}"))
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
