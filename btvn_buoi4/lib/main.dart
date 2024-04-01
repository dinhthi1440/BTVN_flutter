import 'dart:math';

import 'package:btvn_buoi4/model/Food.dart';
import 'package:btvn_buoi4/model/FoodCategory.dart';
import 'package:flutter/material.dart';

import 'CategoryDetail.dart';
import 'FoodDetail.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Categories(),
    ),
  );
}
class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = const [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];

    int colorIndex = -1;
    Color getColorFromIndex() {
      colorIndex++;
      return colorList[colorIndex % colorList.length];
    }
    List<Food> listFood = listF();
    List<FoodCategory> listCategory = [];
    for (Food food in listFood) {
      for(String foodCate in food.categories){
        bool found = false;
        for(FoodCategory category in listCategory){
          if(foodCate.contains(category.name)){
            category.listFood.add(food);
            found =true;
          }
        }
        if(!found){
          listCategory.add(FoodCategory(
            id: listCategory.length + 1,
            name: foodCate,
            listFood: [food],
          ));
        }
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Categories",style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(listCategory.length, (index){
              return Material(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color:getColorFromIndex(),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CategoryDetail(
                              category: listCategory[index]
                          ))
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "${listCategory[index].name}",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                  )
              );
            })
        ),
      ),
    );
  }
  List<Food> listF(){
    return [
      Food(
        id: 0, image: "https://file.hstatic.net/1000389344/file/mi_spaghettiii_8253b4576dea479792271839f54fe61b_grande.jpeg",
        titleName: "Spaghetti",
        ingredients: ["Pasta", "Tomato sauce", "Meatballs"],
        steps: ["Boil pasta", "Cook meatballs", "Mix with tomato sauce"],
        categories: ["Italian", "Pasta"],
        timeCook: 20,
      ),
      Food(
        id: 1,
        image: "https://img.dominos.vn/cach-lam-pizza-thap-cam-0.jpg",
        titleName: "Pizza",
        ingredients: ["Dough", "Tomato sauce", "Cheese", "Pepperoni"],
        steps: ["Roll out the dough", "Spread the sauce", "Add toppings", "Bake"],
        categories: ["Italian", "Fast Food"],
        timeCook: 30,
      ),
      Food(
        id: 2,
        image: "https://www.vinmec.com/s3-images/20210317_143609_055773_sushi.max-800x800.jpg",
        titleName: "Sushi",
        ingredients: ["Rice", "Fish", "Seaweed", "Vegetables"],
        steps: ["Prepare sushi rice", "Slice fish", "Wrap with seaweed", "Serve"],
        categories: ["Japanese", "Seafood"],
        timeCook: 45,
      ),
      Food(
        id: 3,
        image: "https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg",
        titleName: "Burger",
        ingredients: ["Beef patty", "Burger bun", "Lettuce", "Tomato", "Cheese"],
        steps: ["Grill the patty", "Toast the bun", "Assemble the burger", "Serve"],
        categories: ["American", "Fast Food"],
        timeCook: 20,
      ),
      Food(
        id: 4,
        image: "https://cdn.tgdd.vn/Files/2021/09/20/1384126/cong-thuc-lam-mon-tacos-ga-kieu-mexico-voi-nuoc-sot-toi-cuc-de-lam-tai-nha-202109201018535920.jpg",
        titleName: "Tacos",
        ingredients: ["Tortillas", "Ground beef", "Lettuce", "Tomato", "Cheese", "Salsa"],
        steps: [
          "Cook ground beef with taco seasoning",
          "Warm up tortillas",
          "Assemble tacos with toppings",
          "Serve with salsa"
        ],
        categories: ["Mexican", "Street Food"],
        timeCook: 25,
      ),
      Food(
        id: 5,
        image: "https://insanelygoodrecipes.com/wp-content/uploads/2022/09/Healthy-Homemade-Salmon-Steak-with-Tartar-Sauce.jpg",
        titleName: "Salmon Steak",
        ingredients: ["Salmon fillet", "Lemon", "Garlic", "Olive oil", "Salt", "Pepper"],
        steps: [
          "Marinate salmon fillet with lemon, garlic, olive oil, salt, and pepper",
          "Pan-sear salmon until golden brown",
          "Serve with lemon wedges"
        ],
        categories: ["Seafood", "Healthy"],
        timeCook: 15,
      ),
      Food(
        id: 6,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQegLEmqV9p0MNi3OQO7UJkzFmWxwR_j1M75g&usqp=CAU",
        titleName: "Chicken Alfredo Pasta",
        ingredients: ["Chicken breast", "Pasta", "Cream", "Parmesan cheese", "Garlic", "Butter"],
        steps: [
          "Cook chicken breast until golden brown",
          "Boil pasta until al dente",
          "Prepare Alfredo sauce with cream, Parmesan cheese, and garlic",
          "Combine cooked pasta, sliced chicken, and Alfredo sauce",
          "Serve hot with grated Parmesan on top"
        ],
        categories: ["Italian", "Pasta", "Comfort Food"],
        timeCook: 40,
      ),
      Food(
        id: 7,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYhFk6WinTs7JvwT8VUW8HGH3P4UNWFNr7GQ&usqp=CAU",
        titleName: "Pad Thai",
        ingredients: ["Rice noodles", "Shrimp", "Tofu", "Bean sprouts", "Peanuts", "Egg"],
        steps: [
          "Soak rice noodles in warm water until softened",
          "Stir-fry shrimp, tofu, and egg in a wok",
          "Add rice noodles and bean sprouts to the wok",
          "Season with Pad Thai sauce and toss to combine",
          "Serve hot garnished with crushed peanuts and lime wedges"
        ],
        categories: ["Thai", "Noodles", "Seafood"],
        timeCook: 30,
      ),
      Food(
        id: 8,
        image: "https://khinskitchen.com/wp-content/uploads/2023/03/beef-stir-fry-01.jpg",
        titleName: "Beef Stir-Fry",
        ingredients: ["Beef sirloin", "Broccoli", "Bell peppers", "Onion", "Soy sauce", "Garlic"],
        steps: [
          "Slice beef thinly and marinate with soy sauce and garlic",
          "Stir-fry beef in a hot skillet until browned",
          "Add broccoli, bell peppers, and onion to the skillet",
          "Season with more soy sauce and stir-fry until vegetables are tender",
          "Serve hot over steamed rice"
        ],
        categories: ["Asian", "Stir-Fry", "Beef"],
        timeCook: 25,
      ),
      Food(
        id: 9,
        image: "https://greenbowl2soul.com/wp-content/uploads/2021/06/Indian-vegetable-curry.jpg",
        titleName: "Vegetable Curry",
        ingredients: ["Mixed vegetables", "Coconut milk", "Curry paste", "Onion", "Garlic", "Ginger"],
        steps: [
          "Sauté onion, garlic, and ginger in a pot until fragrant",
          "Add mixed vegetables to the pot and stir to coat",
          "Pour in coconut milk and curry paste",
          "Simmer until vegetables are tender and curry thickens",
          "Serve hot over cooked rice or with naan bread"
        ],
        categories: ["Vegetarian", "Curry", "Indian"],
        timeCook: 35,
      ),
      Food(
        id: 10,
        image: "https://cdn.tgdd.vn/2020/07/CookProduct/caesar-salad-la-gi-cach-lam-chi-tiet-caesar-salad-760x367-760x367.jpg",
        titleName: "Caesar Salad",
        ingredients: ["Romaine lettuce", "Croutons", "Parmesan cheese", "Caesar dressing"],
        steps: [
          "Tear romaine lettuce leaves into bite-sized pieces",
          "Toss lettuce with croutons and grated Parmesan cheese",
          "Drizzle Caesar dressing over the salad",
          "Garnish with additional Parmesan cheese and black pepper",
          "Serve chilled"
        ],
        categories: ["Salad", "Healthy", "Vegetarian"],
        timeCook: 15,
      ),
      Food(
        id: 11,
        image: "https://png.pngtree.com/thumb_back/fh260/background/20210912/pngtree-chinese-cuisine-fried-rice-with-fresh-vegetables-image_863631.jpg",
        titleName: "Fried Rice",
        ingredients: ["Cooked rice", "Eggs", "Carrots", "Peas", "Green onions", "Soy sauce"],
        steps: [
          "Heat oil in a skillet and scramble eggs",
          "Add cooked rice to the skillet and stir-fry",
          "Mix in diced carrots, peas, and sliced green onions",
          "Season with soy sauce and continue to stir-fry until heated through",
          "Serve hot as a main dish or side"
        ],
        categories: ["Asian", "Rice", "Stir-Fry"],
        timeCook: 20,
      ),
    ];
  }
}




