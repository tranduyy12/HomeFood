import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:homefood/auth/sign_up_page.dart';
import 'package:homefood/base/custom_loader.dart';
import 'package:homefood/base/show_custom_snackbar.dart';
import 'package:homefood/controller/auth_controller.dart';
import 'package:homefood/route/route_helper.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/app_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      // var authController = Get.find<AuthController>();

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Nhập email của bạn", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Nhập email hợp lệ", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Nhập mật khẩu của bạn", title: "Mật Khẩu");
      } else if (password.length < 6) {
        showCustomSnackBar(
          "Mật khẩu phải có ít nhất 6 ký tự",
          title: "Mật Khẩu",
        );
      } else {
        // print(signUpBody.toString());
        // Perform registration
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            print("Kết quả đăng nhập: ${status.isSuccess}");
            print("Thông báo: ${status.message}");
            // Get.to(SignInPage());
            Get.toNamed(RouteHelper.getInitial());
            // Get.toNamed(RouteHelper.getCartPage());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage: AssetImage(
                            "assets/images/logo part 1.png",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              fontSize:
                                  Dimensions.font20 * 3 + Dimensions.font20 / 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppTextField(
                      textController: emailController,
                      hintText: "Nhập Email",
                      icon: Icons.email,
                    ),
                    SizedBox(height: Dimensions.height20),
                    AppTextField(
                      textController: passwordController,
                      hintText: "Nhập Mật Khẩu",
                      icon: Icons.password,
                      isObscureText: true,
                    ),
                    SizedBox(height: Dimensions.height20),

                    Row(
                      children: [
                        Expanded(child: Container()),
                        RichText(
                          text: TextSpan(
                            text: "Đăng nhập tài khoản của bạn",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width20),
                      ],
                    ),
                    // RichText(
                    //   text: TextSpan(
                    //     recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    //     text: "Đăng Nhập",
                    //     style: TextStyle(
                    //       color: AppColors.mainBlackColor,
                    //       fontSize: Dimensions.font20,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: Dimensions.screenHeight * 0.05),

                    //đăng nhập
                    GestureDetector(
                      onTap: () {
                        _login(authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius30,
                          ),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: "Đăng Nhập",
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    //đăng nhập
                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    RichText(
                      text: TextSpan(
                        recognizer:
                            TapGestureRecognizer()..onTap = () => Get.back(),
                        text: "Bạn chưa có tài khoản?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                        children: [
                          TextSpan(
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap =
                                      () => Get.to(
                                        () => SignUpPage(),
                                        transition: Transition.fadeIn,
                                      ),
                            text: "Đăng Kí",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              : CustomLoader();
        },
      ),
    );
  }
}
