import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:homefood/controller/food_detail_cotroller.dart';
import 'package:homefood/controller/recommended_product_controller.dart';
import 'package:homefood/data/repository/recommended_product_repo.dart';
import 'package:homefood/models/products_model.dart';
import 'package:homefood/pages/food/food_detail.dart';
import 'package:homefood/route/route_helper.dart';
import 'package:homefood/utils/app_constants.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/app_colum.dart';
import 'package:homefood/widgets/icon_and_text_widget.dart';
import 'package:homefood/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      pageController.addListener(() {
        setState(() {
          _currPageValue = pageController.page!;
        });
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // phần banner trượt
        GetBuilder<FoodDetailController>(
          builder: (foodDetailImgSize) {
            return foodDetailImgSize.isLoaded
                ? Container(
                  // color: Colors.redAccent,
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    // itemCount: 5,
                    itemCount: foodDetailImgSize.foodDetailList.length,
                    itemBuilder: (context, position) {
                      return _buildPageItem(
                        position,
                        foodDetailImgSize.foodDetailList[position],
                      );
                    },
                  ),
                )
                : CircularProgressIndicator(color: AppColors.mainColor);
          },
        ),

        //dots
        GetBuilder<FoodDetailController>(
          builder: (foodDetailImgSize) {
            return new DotsIndicator(
              // dotsCount: 5,
              dotsCount:
                  foodDetailImgSize.foodDetailList.isEmpty
                      ? 1
                      : foodDetailImgSize.foodDetailList.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          },
        ),

        //tên mục
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: '.', color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ), // tên mục
        // tên và danh sách món recommended
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return recommendedProduct.isLoaded
                ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // itemCount: 10,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          RouteHelper.getRecommendedFood(index, "home"),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10,
                        ),
                        child: Row(
                          children: [
                            //images
                            Container(
                              height: Dimensions.listViewImgSize,
                              width: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius20,
                                ),
                                color: Colors.red,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedProduct
                                            .recommendedProductList[index]
                                            .img!,
                                  ),
                                ),
                              ),
                            ),
                            //images

                            //text
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextContSize,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      Dimensions.radius20,
                                    ),
                                    bottomRight: Radius.circular(
                                      Dimensions.radius20,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),

                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                        text:
                                            (recommendedProduct
                                                .recommendedProductList[index]
                                                .name!),
                                      ),
                                      SizedBox(height: Dimensions.height10),
                                      // SmallText(
                                      //   // text: "Với đặc trưng từ trung quốc",
                                      //   text:
                                      //       (recommendedProduct
                                      //           .recommendedProductList[index]
                                      //           .description),
                                      // ),
                                      SizedBox(height: Dimensions.height10),
                                      Row(
                                        children: [
                                          //icon1
                                          IconAndTextWidget(
                                            icon:
                                                Icons
                                                    .circle_notifications_sharp,
                                            text: "binh thuong",
                                            iconColor: AppColors.iconColor1,
                                          ),
                                          //icon2
                                          IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "1,7km",
                                            iconColor: AppColors.mainColor,
                                          ),
                                          //icon3
                                          // IconAndTextWidget(
                                          //   icon: Icons.access_time,
                                          //   text: "32min ",
                                          //   iconColor: AppColors.iconColor2,
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //text
                          ],
                        ),
                      ),
                    );
                  },
                )
                : CircularProgressIndicator(color: AppColors.mainColor);
          },
        ),
        // tên và danh sách món
      ],
    );
  }

  Widget _buildPageItem(int index, ProductsModel FoodDetail) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //banner
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getFoodDetail(index, "home"));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        FoodDetail.img!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ////banner
          ///
          ///banner bootom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.width30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: 15,
                  right: 15,
                ),
                //name
                child: AppColum(text: FoodDetail.name!),

                //----chuyển colum về AppColum để tái sử dụng
              ),
            ),
          ),

          ///banner bootom
          ///
          ///
        ],
      ),
    );
  }
}
