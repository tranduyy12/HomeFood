import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:homefood/controller/auth_controller.dart';
import 'package:homefood/controller/cart_controller.dart';
import 'package:homefood/controller/food_detail_cotroller.dart';
import 'package:homefood/controller/recommended_product_controller.dart';
import 'package:homefood/controller/user_controller.dart';
import 'package:homefood/data/api/api_client.dart';
import 'package:homefood/data/repository/auth_repo.dart';
import 'package:homefood/data/repository/cart_repo.dart';
import 'package:homefood/data/repository/food_detail_repo.dart';
import 'package:homefood/data/repository/recommended_product_repo.dart';
import 'package:homefood/data/repository/user_repo.dart';
import 'package:homefood/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(
    () => ApiClient(
      appbaseUrl: AppConstants.BASE_URL,
      sharedPreferences: Get.find(),
    ),
  );
  Get.lazyPut(
    () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
  );
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  //repos
  Get.lazyPut(() => FoodDetailRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => FoodDetailController(foodDetailRepo: Get.find()));
  Get.lazyPut(
    () => RecommendedProductController(recommendedProductRepo: Get.find()),
  );
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
