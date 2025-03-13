import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:homefood/Screen/gio_hang.dart';
import 'package:homefood/widgets/Big_text.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          // icon menu left
          Icon(Icons.sort, size: 30, color: Colors.red),

          // tiêu de shop
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: BigText(text: "HOME FOOD", size: 32, color: Colors.red),
          ),

          //icon gio hang
          Spacer(),
          badges.Badge(
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(4),
            ),
            badgeContent: Text('3', style: TextStyle(color: Colors.black)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GioHang(),
                  ), // sang trang gio hang
                );
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Color.fromARGB(255, 56, 40, 204),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
