
import 'package:btvn_tuan7/FoodDetail.dart';
import 'package:btvn_tuan7/data.dart';
import 'package:btvn_tuan7/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FormatNumber.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => CartProvider()
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHome(),
        )
    );
  }
}



class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: FoodData.typeOfFood.length,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                actions: <Widget>[
                  InkWell(
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.red,
                      ),
                      onPressed: () {

                      },
                    ),
                  )
                ],
                bottom: TabBar(
                  tabAlignment: TabAlignment.center,
                  isScrollable: true,
                  indicatorColor: Colors.red,
                  labelColor: Colors.red,
                  tabs: FoodData.typeOfFood.map((type)
                  => Tab(child: Text(type.nameOfType))).toList()
                ),
              ),
              body: TabBarView(
                children: FoodData.typeOfFood.map((type)
                => TabCategory(nameOfType: type.nameOfType,
                  listFoodByType: FoodData.listFoods.where((food)
                  => food.typeId == type.id).toList())).toList(),
              ),
              bottomNavigationBar: (context.watch<CartProvider>().totalQuantity > 0)? BottomShopping() : null)),
    );
  }

}

Widget _itemFoodInCard(Food food, BuildContext context) {
  return Container(
     margin: EdgeInsets.only(left: 8, right: 8, top: 4),
     padding: EdgeInsets.only(bottom: 4),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
    height: 60,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(food.imageUlr),
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              food.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
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
                      fontSize: 14,
                    )),
                PlusMinusButton(context, food)
              ],
            )
          ],
        ))
      ],
    ),
  );
}

class BottomShopping extends StatelessWidget {
  const BottomShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.red,
                    size: 40,
                  ),
                  onTap: () {

                    showModalBottomSheet<void>(
                        context: context,
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        builder: (context) {
                          return _bottomSheetShopping(context, true);
                        });
                  },
                ),
                Positioned(
                  top: -3,
                  right: -3,
                  child: Container(
                    height: 16,
                    width: 16,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Text(context.watch<CartProvider>().totalQuantity.toString(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                    ),),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "${FormatNumber.formatMoney(context.watch<CartProvider>().totalMoney)}đ",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                height: 45,
                color: Colors.red,
                width: 110,
                alignment: Alignment.center,
                child: Text(
                  "Giao hàng",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
Widget _bottomSheetShopping(BuildContext context, bool isCartPress){
  return Container(
    child: Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: const Text(
                    "Xóa tất cả",
                    style: TextStyle(
                        color: Colors.red, fontSize: 12),
                  ),
                  onTap: () {
                    context.read<CartProvider>().clearAll();
                  },
                ),
                const Text(
                  "Giỏ hàng",

                  style: TextStyle(
                      color: Colors.black, fontSize: 14),
                ),
                InkWell(
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: context.watch<CartProvider>().listFood.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _itemFoodInCard(context.watch<CartProvider>().listFood.toList()[index], context);
            }),
        ),
        BottomShopping()
      ],
    ),
  );
}

class TabCategory extends StatelessWidget {
  const TabCategory({Key? key, required this.nameOfType, required this.listFoodByType}) : super(key: key);
  final String nameOfType;
  final List<Food> listFoodByType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Text("${nameOfType} (${listFoodByType.length})",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listFoodByType.length,
            itemBuilder: (context, index) {
              return ItemFood(food: listFoodByType[index]);
            },
          )
        ],
      ),
    );
  }
}

class ItemFood extends StatelessWidget {
  const ItemFood({super.key, required this.food});
  final Food food;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetail(food: food)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 8, top: 16),
        padding: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        height: 116,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(food.imageUlr),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      food.describe,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${FormatNumber.formatNumber(food.numOfSold)} đã bán | ${FormatNumber.formatNumber(food.numOfLike)} lượt thích",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
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
            ))
          ],
        ),
      ),
    );
  }
}

Widget PlusMinusButton(BuildContext context, Food food) {
  return (context.watch<CartProvider>().getQuantity(food.id) ==0 )?
  InkWell(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    ),
    onTap: () {
      print("cộng ${context.read<CartProvider>().getQuantity(food.id)}");
      context.read<CartProvider>().updateQuantity(food, "plus");
    },
  )
  : Row(
    children: [
      InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Icon(
            Icons.remove,
            color: Colors.red,
          ),
        ),
        onTap: () {
          print("trừ ${context.read<CartProvider>().getQuantity(food.id)}");
          context.read<CartProvider>().updateQuantity(food, "minus");
        },
      ),
      SizedBox(width: 8),
      Text(
        context.watch<CartProvider>().getQuantity(food.id).toString(),
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(width: 8),
      InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onTap: () {
          print("cộng ${context.read<CartProvider>().getQuantity(food.id)}");
          context.read<CartProvider>().updateQuantity(food, "plus");
        },
      )
    ],
  );
}
