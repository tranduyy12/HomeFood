import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:homefood/auth/sign_in_page.dart';
import 'package:homefood/base/custom_loader.dart';
import 'package:homefood/base/show_custom_snackbar.dart';
import 'package:homefood/controller/auth_controller.dart';
import 'package:homefood/models/signup_body_model.dart';
import 'package:homefood/route/route_helper.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();
      if (name.isEmpty) {
        showCustomSnackBar("Nhập tên của bạn", title: "Tên");
      } else if (email.isEmpty) {
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
      } else if (phone.isEmpty) {
        showCustomSnackBar(
          "Nhập số điện thoại của bạn",
          title: "Số Điện Thoại",
        );
      } else {
        showCustomSnackBar("Đăng kí thành công", title: "Đăng Kí");
        SignUpBody signUpBody = SignUpBody(
          name: name,
          email: email,
          password: password,
          phone: phone,
        );
        // print(signUpBody.toString());
        // Perform registration
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            // Get.to(SignInPage());
            print("Đăng kí thành công");
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (_authController) {
          return !_authController.isLoading
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
                    AppTextField(
                      textController: nameController,
                      hintText: "Nhập Tên",
                      icon: Icons.person,
                    ),
                    SizedBox(height: Dimensions.height20),
                    AppTextField(
                      textController: phoneController,
                      hintText: "Số điện thoại",
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: Dimensions.height20 + Dimensions.height20),
                    GestureDetector(
                      onTap: () {
                        _registration(_authController);
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
                            text: "Đăng Kí",
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () => Get.to(SignInPage()),
                        text: "Bạn đã có tài khoản?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                      ),
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
                    RichText(
                      text: TextSpan(
                        recognizer:
                            TapGestureRecognizer()..onTap = () => Get.back(),
                        text: "Đăng kí bằng một tài khoản khác",
                        style: TextStyle(
                          color: AppColors.mainBlackColor,
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: Dimensions.radius30,
                            backgroundImage: AssetImage(
                              "assets/images/" + singUpImages[index],
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              // : CircularProgressIndicator();
              : CustomLoader();
        },
      ),
    );
  }
}
