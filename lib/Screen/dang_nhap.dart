import 'package:flutter/material.dart';
import 'package:homefood/Screen/dang_ki.dart';
import 'package:homefood/Screen/home_food.dart';
import 'package:homefood/home/main_food_page.dart';

class DangNhap extends StatelessWidget {
  const DangNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 76),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.food_bank_outlined, size: 100),

              //tiêu đề
              Text(
                ' Xin chào bạn ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              SizedBox(height: 10),

              //tiêu đề
              Text(
                ' Chào mừng bạn đến với HomeFood ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),

              // text  tài khoản
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập tên đăng nhập',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //text mat khẩu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập password',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              //button đăng nhập
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    // chuyển hướng sang man home
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainFoodPage()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Đăng nhập')),
                  ),
                ),
              ),

              //quen mat khẩu
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bạn chưa có tài khoản ?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(width: 5),

                  GestureDetector(
                    onTap: () {
                      // điều hướng sang màn đăng kí
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DangKi()),
                      );
                    },
                    child: Text(
                      'đăng kí',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
