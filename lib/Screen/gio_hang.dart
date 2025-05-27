import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:homefood/pages/food/food_detail.dart';
import 'package:homefood/pages/home/main_food_page.dart';
import 'package:homefood/widgets/app_icon.dart';

class GioHang extends StatelessWidget {
  const GioHang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainFoodPage()),
            );
          },
          child: AppIcon(icon: Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
