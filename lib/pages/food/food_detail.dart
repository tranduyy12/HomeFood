// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:homefood/Screen/gio_hang.dart';
import 'package:homefood/Screen/home_food.dart';
import 'package:homefood/controller/cart_controller.dart';
import 'package:homefood/controller/food_detail_cotroller.dart';
import 'package:homefood/pages/cart/cart_page.dart';
import 'package:homefood/pages/home/main_food_page.dart';
import 'package:homefood/route/route_helper.dart';
import 'package:homefood/utils/app_constants.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/app_colum.dart';
import 'package:homefood/widgets/app_icon.dart';
import 'package:homefood/widgets/exandable_text.dart';
import 'package:homefood/widgets/icon_and_text_widget.dart';
import 'package:homefood/widgets/small_text.dart';

class FoodDetail extends StatelessWidget {
  int pageId;
  final String page;
  FoodDetail({Key? key, required this.pageId, required this.page})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<FoodDetailController>().foodDetailList[pageId];
    Get.find<FoodDetailController>().intitProduct(
      product,
      Get.find<CartController>(),
    );
    // print("pageId:" + pageId.toString());
    // print("product:" + product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //vi tri img
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.foodDetailImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //vi tri img

          //vi tri icon
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MainFoodPage()),
                    // );
                    if (page == "cartpage") {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),

                GetBuilder<FoodDetailController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1)
                          Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<FoodDetailController>().totalItems >= 1
                              ? Positioned(
                                right: 0,
                                top: 0,

                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              )
                              : Container(),
                          Get.find<FoodDetailController>().totalItems >= 1
                              ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(
                                  text:
                                      Get.find<FoodDetailController>()
                                          .totalItems
                                          .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          //vi tri icon

          //vi tri text
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.foodDetailImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColum(text: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Giới thiệu"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExandableTextWidget(text: product.description!),
                    ),
                  ),
                ],
              ),
              //---
            ),
          ),
          //vi tri text
        ],
      ), //
      // bottomNavigationBar
      bottomNavigationBar: GetBuilder<FoodDetailController>(
        builder: (foodDetailImgSize) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),

            ///--
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                //so luong
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height15,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          foodDetailImgSize.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor),
                      ),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: foodDetailImgSize.inCartItems.toString()),
                      SizedBox(width: Dimensions.width10 / 2),
                      GestureDetector(
                        onTap: () {
                          foodDetailImgSize.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor),
                      ),
                    ],
                  ),
                ),
                //so luong

                //button
                GestureDetector(
                  onTap: () {
                    foodDetailImgSize.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),

                    child: BigText(
                      text: "\$ ${product.price!}| Đặt đơn",
                      color: Colors.white,
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                //button
              ],
            ),
            //---
          );
        },
      ),

      ///bottomNavigationBar
    );
  }
}
