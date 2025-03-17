import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:homefood/Screen/dang_ki.dart';
import 'package:homefood/Screen/dang_nhap.dart';
import 'package:homefood/Screen/home_food.dart';
import 'package:homefood/Screen/main_food_page.dart';
import 'package:homefood/home/food_page_body.dart';

void main() {
  runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, home: MainFoodPage()),
  );
}
