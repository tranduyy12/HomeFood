// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homefood/controller/food_detail_cotroller.dart';
import 'package:homefood/controller/recommended_product_controller.dart';
import 'package:homefood/route/route_helper.dart';
import 'package:homefood/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // late Animation<double> animation;
  // late AnimationController controller;
  // @override
  // void initState() {
  //   super.initState();
  //   controller = new AnimationController(
  //     duration: const Duration(seconds: 3),
  //     vsync: this,
  //   );
  // }

  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResources() async {
    await Get.find<FoodDetailController>().getFoodDetailList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 3), () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/images/logo part 1.png",
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo part 2.png",
              width: Dimensions.splashImg,
            ),
          ),
        ],
      ),
    );
  }
}
