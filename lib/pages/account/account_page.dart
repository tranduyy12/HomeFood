import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homefood/base/custom_loader.dart';
import 'package:homefood/controller/auth_controller.dart';
import 'package:homefood/controller/cart_controller.dart';
import 'package:homefood/controller/user_controller.dart';
import 'package:homefood/route/route_helper.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/account_widget.dart';
import 'package:homefood/widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(text: "Hồ Sơ", size: 24, color: Colors.white),
      ),
      body: GetBuilder<UserController>(
        builder: (UserController) {
          return _userLoggedIn
              ? (UserController.isLoading
                  ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(
                      children: [
                        //profile icon
                        AppIcon(
                          icon: Icons.person,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          size: Dimensions.height15 * 10,
                          iconSize: Dimensions.height45 + Dimensions.height30,
                        ),
                        //name
                        SizedBox(height: Dimensions.height30),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.person,
                                    iconColor: Colors.white,
                                    backgroundColor: AppColors.mainColor,
                                    size: Dimensions.height10 * 5,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                  ),
                                  // bigText: BigText(
                                  //   text: UserController.userModel.name,
                                  // ),
                                  bigText: BigText(text: "duy"),
                                ),

                                //phone number
                                SizedBox(height: Dimensions.height20),
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.phone,
                                    iconColor: Colors.white,
                                    backgroundColor: AppColors.yellowColor,
                                    size: Dimensions.height10 * 5,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                  ),
                                  // bigText: BigText(
                                  //   text: UserController.userModel.phone,
                                  // ),
                                  bigText: BigText(text: "0987654321"),
                                ),
                                SizedBox(height: Dimensions.height20),

                                //email
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.email,
                                    iconColor: Colors.white,
                                    backgroundColor: AppColors.yellowColor,
                                    size: Dimensions.height10 * 5,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                  ),
                                  // bigText: BigText(
                                  //   text: UserController.userModel.email,
                                  // ),
                                  bigText: BigText(text: "a@a.com"),
                                ),
                                SizedBox(height: Dimensions.height20),

                                //address
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.location_on,
                                    iconColor: Colors.white,
                                    backgroundColor: AppColors.yellowColor,
                                    size: Dimensions.height10 * 5,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                  ),
                                  bigText: BigText(text: "hà noi 12312321"),
                                ),
                                SizedBox(height: Dimensions.height20),

                                //message
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.message,
                                    iconColor: Colors.white,
                                    backgroundColor: Colors.redAccent,
                                    size: Dimensions.height10 * 5,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                  ),
                                  bigText: BigText(text: "Tin nhắn"),
                                ),
                                SizedBox(height: Dimensions.height20),
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>()
                                          .clearCartHistory();
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    } else {
                                      print("bạn đã đăng xuất rồi");
                                    }
                                  },
                                  child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      iconColor: Colors.white,
                                      backgroundColor: Colors.redAccent,
                                      size: Dimensions.height10 * 5,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                    ),
                                    bigText: BigText(text: "Đăng xuất"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : CustomLoader())
              : Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 8,
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius20,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/signintocontinue.png",
                            ),
                          ),
                        ),
                      ),

                      ///
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getSignInPage());
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                          ),
                          child: Center(
                            child: BigText(
                              text: "Vui lòng đăng nhập",
                              color: Colors.white,
                              size: Dimensions.font26,
                            ),
                          ),
                        ),
                      ),

                      ///
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}
