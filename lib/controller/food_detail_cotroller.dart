import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefood/controller/cart_controller.dart';
import 'package:homefood/data/repository/food_detail_repo.dart';
import 'package:homefood/models/cart_model.dart';
import 'package:homefood/models/products_model.dart';
import 'package:homefood/utils/colors.dart';

class FoodDetailController extends GetxController {
  final FoodDetailRepo foodDetailRepo;

  FoodDetailController({required this.foodDetailRepo});
  List<ProductsModel> _foodDetailList = [];
  List<ProductsModel> get foodDetailList => _foodDetailList;
  late CartController _cart;
  //= Get.find<CartController>();

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  // int get quantity{
  //   return _quantity;
  // }
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getFoodDetailList() async {
    Response response = await foodDetailRepo.getFoodDetailList();
    if (response.statusCode == 200) {
      _foodDetailList = [];
      _foodDetailList.addAll(Product.fromJson(response.body).products);
      // print(_foodDetailList);
      _isLoaded = true;
      update();
    } else {
      // print("Could not get food detail");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      // print("increment");
    } else {
      // print("decrement");
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "SỐ LƯỢNG MÓN",
        "Vui lòng chọn số lượng món lớn hơn 0",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "SỐ LƯỢNG MÓN",
        "Vui lòng chọn số lượng món nhỏ hơn 20",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      _quantity = 20;
    } else {
      return quantity;
    }
  }

  void intitProduct(ProductsModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // print('exist in cart' + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    // print('the quantity in cart is' + _inCartItems.toString());
  }

  void addItem(ProductsModel product) {
    // if (quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      // _inCartItems += value.quantity!;
      _inCartItems = _cart.getQuantity(product);
      // print("the idd: " + value.id.toString());
      // print("the name: " + value.quantity.toString());
    });
    // } else {
    //   Get.snackbar(
    //     "SỐ LƯỢNG MÓN",
    //     "Vui lòng chọn món",
    //     backgroundColor: AppColors.mainColor,
    //     colorText: Colors.white,
    //   );
    // }
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
