import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;
  // dynamic height
  static double height15 = screenHeight / 56.27;
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;

  // dynamic width
  static double width15 = screenHeight / 56.27;
  static double width10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  // font size
  static double font16 = screenHeight / 52.75;
  static double font26 = screenHeight / 32.46;
  static double font20 = screenHeight / 42.2;

  // dynamic radius
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
  static double radius15 = screenHeight / 56.27;

  //size icon
  static double iconSize24 = screenHeight / 35.7;
  static double iconSize16 = screenHeight / 52.75;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //food deatil
  static double foodDetailImgSize = screenHeight / 2.41;

  // bottom height
  static double bottomHeightBar = screenHeight / 7.03;

  // splash screen
  static double splashImg = screenHeight / 3.38;
}
