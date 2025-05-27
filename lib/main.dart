import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:homefood/Screen/dang_ki.dart';
import 'package:homefood/Screen/dang_nhap.dart';
import 'package:homefood/Screen/home_food.dart';
import 'package:homefood/auth/sign_in_page.dart';
import 'package:homefood/auth/sign_up_page.dart';
import 'package:homefood/controller/cart_controller.dart';
import 'package:homefood/controller/food_detail_cotroller.dart';
import 'package:homefood/controller/recommended_product_controller.dart';
import 'package:homefood/pages/cart/cart_page.dart';
import 'package:homefood/pages/food/food_detail.dart';
import 'package:homefood/pages/food/recommend_food_detail.dart';

import 'package:homefood/pages/home/food_page_body.dart';
import 'package:homefood/pages/home/main_food_page.dart';
import 'package:homefood/pages/splash/splash_page.dart';
import 'package:homefood/route/route_helper.dart';
import 'helper/dependecies.dart' as dep;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dep.init();

//   Get.find<FoodDetailController>().getFoodDetailList();
//   Get.find<RecommendedProductController>().getRecommendedProductList();

//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: MainFoodPage(),
//       // home: SplashScreen(),
//       initialRoute: RouteHelper.getSplashPage(),
//       getPages: RouteHelper.routes,
//     ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo dependency injection
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<FoodDetailController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Home Food',
              // home: SignInPage(),
              // Đi đến màn splash khi khởi động
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
            );
          },
        );
      },
    );
  }
}
