import 'package:get/get.dart';
import 'package:homefood/data/repository/food_detail_repo.dart';
import 'package:homefood/data/repository/recommended_product_repo.dart';
import 'package:homefood/models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      // print("Got recommended products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_foodDetailList);
      _isLoaded = true;
      update();
    } else {
      // print("Could not get food detail");
    }
  }
}
