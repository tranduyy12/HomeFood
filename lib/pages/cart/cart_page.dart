import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:homefood/base/no_data_page.dart';
import 'package:homefood/controller/auth_controller.dart';
import 'package:homefood/controller/cart_controller.dart';
import 'package:homefood/controller/recommended_product_controller.dart';
import 'package:homefood/models/cart_model.dart';
import 'package:homefood/pages/home/main_food_page.dart';
import 'package:homefood/route/route_helper.dart';
import 'package:homefood/utils/app_constants.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/app_icon.dart';
import 'package:homefood/widgets/small_text.dart';

import '../../controller/food_detail_cotroller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //icons
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          //icons
          GetBuilder<CartController>(
            builder: (_cartController) {
              return _cartController.getItems.length > 0
                  ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      // color: Colors.red,
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                          builder: (cartController) {
                            var _carList = cartController.getItems;
                            return ListView.builder(
                              // itemCount: cartController.getItems.length,
                              itemCount: _carList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  height: Dimensions.width20 * 5,
                                  width: double.maxFinite,
                                  // color: Colors.blue,
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      //--image
                                      GestureDetector(
                                        onTap: () {
                                          var fooddeatilIndex =
                                              Get.find<FoodDetailController>()
                                                  .foodDetailList
                                                  .indexOf(
                                                    _carList[index].product!,
                                                  );
                                          if (fooddeatilIndex >= 0) {
                                            Get.toNamed(
                                              RouteHelper.getFoodDetail(
                                                fooddeatilIndex,
                                                "cartpage",
                                              ),
                                            );
                                          } else {
                                            var recommededIndex = Get.find<
                                                  RecommendedProductController
                                                >()
                                                .recommendedProductList
                                                .indexOf(
                                                  _carList[index].product!,
                                                );
                                            if (recommededIndex < 0) {
                                              Get.snackbar(
                                                "Lịch sử mua hàng",
                                                "Không tìm thấy món ăn",
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                colorText: Colors.white,
                                              );
                                            } else {
                                              Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                  recommededIndex,
                                                  "cartpage",
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: Dimensions.width20 * 5,
                                          height: Dimensions.height20 * 5,
                                          margin: EdgeInsets.only(
                                            bottom: Dimensions.height10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.radius20,
                                            ),
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index]
                                                        .img!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //---image
                                      //----
                                      SizedBox(width: Dimensions.width10),
                                      //--text
                                      Expanded(
                                        child: Container(
                                          height: Dimensions.height20 * 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,

                                            children: [
                                              BigText(
                                                text:
                                                    cartController
                                                        .getItems[index]
                                                        .name!,
                                                color: AppColors.mainBlackColor,
                                              ),
                                              SmallText(text: "đồ ngọt"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  //giá
                                                  BigText(
                                                    text:
                                                        cartController
                                                            .getItems[index]
                                                            .price
                                                            .toString(),
                                                    color: Colors.redAccent,
                                                  ),
                                                  //giá
                                                  //----
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      top: Dimensions.height10,
                                                      bottom:
                                                          Dimensions.height10,
                                                      left: Dimensions.width10,
                                                      right: Dimensions.width10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            Dimensions.radius20,
                                                          ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController
                                                                .addItem(
                                                                  _carList[index]
                                                                      .product!,
                                                                  -1,
                                                                );
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            color:
                                                                AppColors
                                                                    .signColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Dimensions
                                                                  .width10 /
                                                              2,
                                                        ),
                                                        BigText(
                                                          text:
                                                              _carList[index]
                                                                  .quantity
                                                                  .toString(),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Dimensions
                                                                  .width10 /
                                                              2,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController
                                                                .addItem(
                                                                  _carList[index]
                                                                      .product!,
                                                                  1,
                                                                );
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color:
                                                                AppColors
                                                                    .signColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //so luong

                                                  //button
                                                  // Container(
                                                  //   padding: EdgeInsets.only(
                                                  //     top: Dimensions.height10,
                                                  //     bottom: Dimensions.height10,
                                                  //     left: Dimensions.width20,
                                                  //     right: Dimensions.width20,
                                                  //   ),
                                                  //   child: BigText(
                                                  //     text: "100.000đ| Đặt đơn",
                                                  //     color: Colors.white,
                                                  //   ),
                                                  //   decoration: BoxDecoration(
                                                  //     borderRadius: BorderRadius.circular(
                                                  //       Dimensions.radius20,
                                                  //     ),
                                                  //     color: AppColors.mainColor,
                                                  //   ),
                                                  // ),
                                                  //button
                                                  //----
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //--text
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  )
                  : NoDataPage(text: "Giỏ hàng của bạn đang trống");
            },
          ),
        ],
      ),

      // bottomNavigationBar

      //copy
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (CartController) {
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
            child:
                CartController.getItems.length > 0
                    ? Row(
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
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: Dimensions.width10 / 2),
                              BigText(
                                text:
                                    CartController.totalAmount.toString() + "đ",
                              ),
                              SizedBox(width: Dimensions.width10 / 2),
                            ],
                          ),
                        ),
                        //so luong

                        //button
                        GestureDetector(
                          onTap: () {
                            // foodDetailImgSize.addItem(product);
                            if (Get.find<AuthController>().userLoggedIn()) {
                              CartController.addToHistory();
                              // print("history");
                            } else {
                              Get.toNamed(RouteHelper.getSignInPage());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              top: Dimensions.height10,
                              bottom: Dimensions.height10,
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                            ),

                            child: BigText(
                              text: "Thanh Toán",
                              color: Colors.white,
                            ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius20,
                              ),
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                        //button
                      ],
                    )
                    : Container(),
            //---
          );
        },
      ),
      //copy

      ///bottomNavigationBar
    );
  }
}
