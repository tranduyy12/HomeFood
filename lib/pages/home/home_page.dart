import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homefood/auth/sign_in_page.dart';
import 'package:homefood/auth/sign_up_page.dart';
import 'package:homefood/pages/account/account_page.dart';
import 'package:homefood/pages/cart/cart_history.dart';
import 'package:homefood/pages/home/main_food_page.dart';
import 'package:homefood/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //late PersistentTabController _controller;

  List pages = [
    MainFoodPage(),
    // SignInPage(),
    Container(child: Text('History page')),
    CartHistory(),
    AccountPage(),

    // CartPage(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // //   //_controller = PersistentTabController(initialIndex: 0);
  // // }

  // List<Widget> _buildScreens() {
  //   return [
  //     MainFoodPage(),
  //     Container(child: Center(child: Text("next1 page"))),
  //     Container(child: Center(child: Text("next2 page"))),
  //     Container(child: Center(child: Text("next3 page"))),
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.archivebox_fill),
  //       title: ("Lịch sử"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.cart),
  //       title: ("Giỏ hàng"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.person),
  //       title: ("Tài khoản"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Lịch sử"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Giỏ hàng",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Tài khoản"),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return PersistentTabView(
  //     context,
  //     controller: _controller,
  //     screens: _buildScreens(),
  //     items: _navBarsItems(),
  //     handleAndroidBackButtonPress: true, // Default is true.
  //     resizeToAvoidBottomInset:
  //         true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
  //     stateManagement: true, // Default is true.
  //     hideNavigationBarWhenKeyboardAppears: true,
  //     padding: const EdgeInsets.only(top: 8),
  //     backgroundColor: Colors.grey.shade900,
  //     isVisible: true,
  //     animationSettings: const NavBarAnimationSettings(
  //       navBarItemAnimation: ItemAnimationSettings(
  //         // Navigation Bar's items animation properties.
  //         duration: Duration(milliseconds: 400),
  //         curve: Curves.ease,
  //       ),
  //       screenTransitionAnimation: ScreenTransitionAnimationSettings(
  //         // Screen transition animation on change of selected tab.
  //         animateTabTransition: true,
  //         duration: Duration(milliseconds: 200),
  //         screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
  //       ),
  //     ),
  //     confineToSafeArea: true,
  //     navBarHeight: kBottomNavigationBarHeight,
  //     navBarStyle:
  //         NavBarStyle.style1, // Choose the nav bar style with this property
  //   );
  // }
}
