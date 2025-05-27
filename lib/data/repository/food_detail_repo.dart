import 'package:get/get.dart';
import 'package:homefood/data/api/api_client.dart';
import 'package:homefood/utils/app_constants.dart';

class FoodDetailRepo extends GetxService {
  final ApiClient apiClient;
  FoodDetailRepo({required this.apiClient});

  Future<Response> getFoodDetailList() async {
    return apiClient.get(AppConstants.POPULAR_PRODUCT_URI);
    // return apiClient.get(AppConstants.DRINKS_URL);
  }
}
