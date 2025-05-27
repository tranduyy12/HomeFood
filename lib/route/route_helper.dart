import 'package:get/get.dart';
import 'package:homefood/auth/sign_in_page.dart';
import 'package:homefood/pages/cart/cart_page.dart';
import 'package:homefood/pages/food/food_detail.dart';
import 'package:homefood/pages/food/recommend_food_detail.dart';
import 'package:homefood/pages/home/home_page.dart';
import 'package:homefood/pages/home/main_food_page.dart';
import 'package:homefood/pages/splash/splash_page.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String foodDetail = '/food-detail';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getFoodDetail(int pageId, String page) =>
      '$foodDetail?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: initial,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signIn,
      page: () => SignInPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: foodDetail,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return FoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/cart-page',
      page: () => CartPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
