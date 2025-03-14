import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                image: AssetImage('assets/images/food0.png'),
                fit: BoxFit.cover,
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
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                //name
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Banh kem'),
                    SizedBox(height: 10),
                    //name

                    //comments, rate
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SmallText(text: '5'),
                        SizedBox(width: 10),
                        SmallText(text: '128 binh luan'),
                      ],
                    ),

                    //comments, rate

                    //icon vi tri
                    SizedBox(height: 20),
                    Row(
                      children: [
                        //icon1
                        IconAndTextWidget(
                          icon: Icons.circle_notifications_sharp,
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
                        IconAndTextWidget(
                          icon: Icons.access_time,
                          text: "32min ",
                          iconColor: AppColors.iconColor2,
                        ),
                      ],
                    ),
                  ],
                ),
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
